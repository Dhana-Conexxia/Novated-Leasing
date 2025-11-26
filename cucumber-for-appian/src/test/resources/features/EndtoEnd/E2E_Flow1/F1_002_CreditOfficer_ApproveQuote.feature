@Regression @Flow1 @E2E
Feature: E2E - Used Vehicle(Dealer)

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-testanz.orix.com.au/suite/portal/login.jsp"
    And I set appian version to "25.2"
    And I set appian locale to "en_GB"
    Given I login with username "dhana.creditmanager@yopmail.com" and password "ORIX@2025"

  Scenario:Novated Credit Officer Approve Quote
    When I sort grid "[1]" by column "Last Updated On"
    When I click on link "APP-1200"
    When I wait for "7" seconds
    When I refresh
    #When I verify field "ORION" in section "All Event History" contains "Updated Application"
    #When I click on button "Take Ownership"
    #When I click on button "DONE"
    When I click on text "View All"
    #When I verify field "ORION" in section "All Event History" contains "Updated Application"
    When I verify text "Updated Decision" is present
    When I click on icon link "X"
    When I click on button "Update Credit Decision"
    When I populate field "Decision" with "Approved"
    When I click on button "SUBMIT"
    When I wait for progress bar
    Then I tear down

