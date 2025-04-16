package com.appiancorp.ps.automatedtest.tempo.interfaces;

import java.time.Duration;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.appiancorp.ps.automatedtest.common.Settings;
import com.appiancorp.ps.automatedtest.properties.WaitFor;

public class TempoPickerFieldSuggestion extends TempoPickerField implements WaitFor {

  @SuppressWarnings("unused")
  private static final Logger LOG = LogManager.getLogger(TempoPickerFieldSuggestion.class);

  public static TempoPickerFieldSuggestion getInstance(Settings settings) {
    return new TempoPickerFieldSuggestion(settings);
  }

  private TempoPickerFieldSuggestion(Settings settings) {
    super(settings);
  }

  @Override
  public void waitFor(String... params) {
    String fieldValue = getParam(0, params);
    String isFieldValuePartialMatch = getParam(1, params);

    if("true".equals(isFieldValuePartialMatch)) {
      (new WebDriverWait(settings.getDriver(), Duration.ofSeconds(settings.getTimeoutSeconds()))).until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpathFormat(
          XPATH_ABSOLUTE_PICKER_SUGGESTION_CONTAINS, fieldValue))));
    }
    else {
      (new WebDriverWait(settings.getDriver(), Duration.ofSeconds(settings.getTimeoutSeconds()))).until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xpathFormat(
          XPATH_ABSOLUTE_PICKER_SUGGESTION, fieldValue))));
    }
  }
}
