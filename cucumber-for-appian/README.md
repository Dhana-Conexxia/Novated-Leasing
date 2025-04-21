# Cucumber For Appian

## Overview

1. We host all the CucumberForAppian related artifacts in the `CucumberForAppian` directory
1. All the `StepDefs` are present in */CucumberForAppian/src/main/java/com/appiancorp/ps/cucumber/fixtures/*
    - `StepDefs` refer to the Java methods that all the Gherkin language tests connect to to execute the actual logic
1. There are three StepDef files:
    - `CucumberBaseFixture.java`
    - `CucumberSitesFixture`
    - `CucumberTempoFixture`
1. They all correspond 1-1 with all the defined fixture classes present in
   */src/main/java/com/appiancorp/ps/automatedtest/fixture*
1. The `CheatSheet.feature` file located in
   */CucumberForAppian/src/main/resources/TestExample/src/test/resources/CheatSheet.feature* lists out all the methods
   we support and how to invoke them using the `@Given, @When, @Then, @But, @And....` and other Cucumber supported
   annotation

## Maintenance

- Cucumber fixtures are essentially a wrapper and call all the FitNesse fixture methods defined in
  */src/main/java/com/appiancorp/ps/automatedtest/fixture/ \*.java*
- Any addition made in the FitNesse fixtures that will be available to customers need to have a corresponding entry in
  the appropriate Cucumber fixture file
- Any addition to the CheatSheet for FitNesse need to be mirrored in the CheatSheet for Cucumber
- Any addition to unit tests for FitNesse fixtures should have a mirrored entry in the Integration tests for Cucumber
  fixtures
- **Main point to take away is that whatever edits you make in FitNesse should be duplicated in Cucumber**
