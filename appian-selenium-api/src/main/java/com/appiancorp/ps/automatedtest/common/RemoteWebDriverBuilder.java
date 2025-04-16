package com.appiancorp.ps.automatedtest.common;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.Capabilities;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.LocalFileDetector;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.base.Splitter;
import com.google.common.base.Strings;

public class RemoteWebDriverBuilder {
  private static URL REMOTE_URL;
  private static final Logger LOG =  LoggerFactory.getLogger(RemoteWebDriverBuilder.class);

  static { REMOTE_URL = createURL("http://localhost:4444/wd/hub/"); }

  private Constants.RemoteDriver browser;

  public RemoteWebDriverBuilder browser(Constants.RemoteDriver browser) {
    this.browser = browser;
    return this;
  }

  public WebDriver create(Properties props) { return createRemoteDriver(props); }

  private WebDriver createRemoteDriver(Properties props) {
    LOG.info("Creating remote driver for browser '{}'", browser);
    String ipAddress = props.getProperty(browser.getBrowserIP());
    String hostPort = props.getProperty(browser.getBrowserPort());
    String protocol = props.getProperty(browser.getBrowserProtocol());

    if (!StringUtils.isBlank(ipAddress) || !StringUtils.isBlank(hostPort)) {
      ipAddress = StringUtils.isBlank(ipAddress) ? "localhost" : ipAddress;
      hostPort = StringUtils.isBlank(hostPort) ? "4444" : hostPort; 
      REMOTE_URL = createURL(protocol + "://" + ipAddress + ":" + hostPort + "/wd/hub/");
    }

    Capabilities options;
    if (Constants.RemoteDriver.REMOTE_FIREFOX.equals(browser)) {
      options = getRemoteFirefoxOptions(props);
    } else if (Constants.RemoteDriver.REMOTE_CHROME.equals(browser)) {
      options = getRemoteChromeOptions(props);
    } else {
      throw new UnsupportedOperationException(
          String.format("Unsupported browser '%s'. Only Chrome and Firefox is supported", browser));
    }

    RemoteWebDriver driver = new RemoteWebDriver(REMOTE_URL, options);
    driver.setFileDetector(new LocalFileDetector()); // for file uploads from local disk to work with RemoteWebDriver
    //driver.manage().timeouts().pageLoadTimeout(2, MINUTES); // Causes firefox to fail

    // driver.manage().window().maximize() does not work in Chrome
    // instead Chrome windows are maximized via ChromeOptions (see getRemoteChromeOptions)
    if (browser != Constants.RemoteDriver.REMOTE_CHROME) {
      driver.manage().window().maximize();
    }
    LOG.info("Created remote driver '{}'", driver);
    return driver;
  }

  private Capabilities getRemoteFirefoxOptions(Properties props) {
    FirefoxOptions options = new FirefoxOptions();
    options.setProfile(getFirefoxProfile(props));
    LOG.info("Created remote firefox options '{}'", options);
    return options;
  }

  private FirefoxProfile getFirefoxProfile(Properties props) {
    FirefoxProfile profile = new FirefoxProfile();
    profile.setPreference("acceptInsecureCerts", true);
    profile.setPreference("dom.file.createInChild", true);
    profile.setPreference("browser.startup.homepage_override.mstone", "ignore");
    profile.setPreference("startup.homepage_welcome_url.additional", "about:blank");

    //Download properties
    if (!StringUtils.isBlank(props.getProperty(Constants.DOWNLOAD_DIRECTORY))) {
      profile.setPreference("browser.download.folderList", 2);
      profile.setPreference("browser.download.manager.showWhenStarting", false);
      profile.setPreference("browser.download.dir", FilenameUtils.separatorsToSystem(props.getProperty(Constants.DOWNLOAD_DIRECTORY)));
      profile.setPreference("browser.helperApps.neverAsk.saveToDisk", props.getProperty(Constants.DOWNLOAD_MIME_TYPES));
    }

    LOG.info("Using firefox profile '{}'", profile);
    return profile;
  }

  private static Capabilities getRemoteChromeOptions(Properties props) {
    ChromeOptions options = new ChromeOptions();
    options.addArguments("--start-maximized");
    options.addArguments("--disable-extensions");
    // Due to https://github.com/SeleniumHQ/selenium/issues/11750
    options.addArguments("--remote-allow-origins=*");

    //Download properties
    if (!StringUtils.isBlank(props.getProperty(Constants.DOWNLOAD_DIRECTORY))) {
      HashMap<String, Object> chromePrefs = new HashMap<String, Object>();
      chromePrefs.put("profile.default_content_settings.popups", 0);
      chromePrefs.put("download.default_directory", FilenameUtils.separatorsToSystem(props.getProperty(Constants.DOWNLOAD_DIRECTORY)));
      chromePrefs.put("safebrowsing.enabled", "true");
      options.setExperimentalOption("prefs", chromePrefs);
    }

    //Load capabilities from a file
    String capabilityString = props.getProperty(Constants.CHROME_CAPABILITIES);
    if (!Strings.isNullOrEmpty(capabilityString)) {
      Map<String,String> capabilityMap = null;
      try {
        capabilityMap = Splitter.on(",").withKeyValueSeparator("=").split(capabilityString);
      } catch (Exception e) {
        LOG.warn("Wrong format for remote chrome capabilities. Use comma to separate between capabilities.");
      }

      if (capabilityMap != null) {
        Set<String> capabilityNames = capabilityMap.keySet();
        for (String capability : capabilityNames) {
          String capabilityValue = capabilityMap.get(capability);
          LOG.debug("Adding Capability: (" + capability + ", " + capabilityValue + "}");
          options.setCapability(capability, capabilityValue);
        }
      }
    }
    return options;
  }

  private static URL createURL(String url) {
    try{
      return new URL(url);
    } catch (MalformedURLException e) {
      throw new RuntimeException(e);
    }
  }
}

