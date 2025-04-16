package com.appiancorp.ps.automatedtest.tempo.interfaces;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.appiancorp.ps.automatedtest.common.Settings;
import com.appiancorp.ps.automatedtest.common.Version;
import com.google.common.base.Strings;

public class TempoRadioField extends AbstractTempoField {

  private static final Logger LOG = LogManager.getLogger(TempoRadioField.class);
  private static final String XPATH_RELATIVE_RADIO_FIELD_CHOICE_LABEL = Settings.getByConstant("xpathRelativeRadioFieldChoiceLabel");
  private static final String XPATH_RELATIVE_RADIO_FIELD_CHOICE_INDEX = Settings.getByConstant("xpathRelativeRadioFieldChoiceIndex");
  private static final String XPATH_RELATIVE_RADIO_BUTTON_GROUP = Settings.getByConstant("xpathRelativeRadioButtonGroup");
  private static final String XPATH_RELATIVE_RADIO_FIELD_INPUT_SPAN = Settings.getByConstant("xpathRelativeRadioFieldInputSpan");

  public static TempoRadioField getInstance(Settings settings) {
    return new TempoRadioField(settings);
  }

  protected TempoRadioField(Settings settings) {
    super(settings);
  }

  @Override
  public void populate(WebElement fieldLayout, String... params) {
    String fieldValue = getParam(1, params);
    String fixFor17_1 = "";

    if (Settings.getVersion().compareTo(new Version(17, 1)) >= 0) {
      fixFor17_1 = "/parent::div/label";
    }

    if (LOG.isDebugEnabled()) LOG.debug("POPULATION [" + fieldValue + "]");

    WebElement radioField;
    if (isFieldIndex(fieldValue)) {
      int index = getIndexFromFieldIndex(fieldValue);
      radioField = fieldLayout.findElement(By.xpath(xpathFormat(XPATH_RELATIVE_RADIO_FIELD_CHOICE_INDEX + fixFor17_1, index)));
    } else {
      radioField = fieldLayout.findElement(By.xpath(xpathFormat(XPATH_RELATIVE_RADIO_FIELD_CHOICE_LABEL + fixFor17_1, fieldValue)));
    }
    radioField.click();
  }

  @Override
  public String capture(WebElement fieldLayout, String... params) {
    List<String> values = new ArrayList<String>();

    for (WebElement span : fieldLayout.findElements(By.xpath(XPATH_RELATIVE_RADIO_FIELD_INPUT_SPAN))) {
      if (span.findElement(By.tagName("input")).isSelected()) {
        values.add(span.findElement(By.tagName("label")).getText());
      }
    }

    if (LOG.isDebugEnabled()) LOG.debug("RADIO FIELD VALUE : " + values.toString());

    return String.join(",", values);
  }

  @Override
  public boolean contains(WebElement fieldLayout, String... params) {
    String fieldValue = getParam(0, params);

    // For read-only
    try {
      return TempoFieldFactory.getInstance(settings).contains(fieldLayout, fieldValue);
    } catch (Exception e) {
    }

    // For editable
    String compareString;
    if (isFieldIndex(fieldValue)) {
      int index = getIndexFromFieldIndex(fieldValue);
      compareString = fieldLayout.findElement(By.xpath(xpathFormat(XPATH_RELATIVE_RADIO_FIELD_CHOICE_INDEX, index))).getAttribute(
        "checked");
    } else {
      compareString = fieldLayout.findElement(By.xpath(xpathFormat(XPATH_RELATIVE_RADIO_FIELD_CHOICE_LABEL, fieldValue))).getAttribute(
        "checked");
    }
    if (LOG.isDebugEnabled()) LOG.debug("RADIO FIELD COMPARISON : Field value [" + fieldValue + "] is checked [" + compareString + "]");

    return compareString.equals("true");
  }

  @Override
  public boolean isNotBlank(WebElement fieldLayout) {
    return !Strings.isNullOrEmpty(capture(fieldLayout));
  }

  public static boolean isType(WebElement fieldLayout) {
    try {
      fieldLayout.findElement(By.xpath(XPATH_RELATIVE_RADIO_BUTTON_GROUP));
    } catch (Exception e) {
      return false;
    }

    return true;
  }

  @Override
  public void clear(WebElement fieldLayout, String... params) {
    // NOOP
  }
}
