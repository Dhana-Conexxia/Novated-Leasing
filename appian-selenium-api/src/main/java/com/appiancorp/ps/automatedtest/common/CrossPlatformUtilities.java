package com.appiancorp.ps.automatedtest.common;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class CrossPlatformUtilities {
  public static void selectAll(WebElement selectedField, WebDriver driver) {
    if (Settings.isMacOs()) {
      if (driver instanceof org.openqa.selenium.chrome.ChromeDriver) {
        selectedField.sendKeys(Keys.ESCAPE);
        selectedField.sendKeys(Keys.chord(Keys.SHIFT, Keys.END));
        selectedField.sendKeys(Keys.chord(Keys.SHIFT, Keys.HOME));
      }
      else {
        selectedField.sendKeys(Keys.chord(Keys.COMMAND, "a"));
      }
    } else {
      selectedField.sendKeys(Keys.chord(Keys.CONTROL, "a"));
    }
  }
}
