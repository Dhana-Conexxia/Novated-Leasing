@Regression @Sprint1
Feature: Driver Submits Initial Contact Enquiry - 'Log Customer Enquiry' Section from Dashboard of Novated specialist

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-testanz.orix.com.au/suite/portal/login.jsp"
    And I set appian version to "25.2"
    And I set appian locale to "en_GB"
    Given I login with username "dhana.novatedspecialist@yopmail.com" and password "ORIX@2025"

  Scenario: Navigate to 'Log Customer Enquiry' Section from Dashboard of Novated specialist
    When I click on text "Enquiries"
    When I click on button "Log Enquiry"
    When I wait for "3" seconds
    #Log Customer Enquiry - Fill in the details below to log a customer enquiry
    When I populate field "First Name" with "Abc"
    When I populate field "Last Name" with "Query"
    When I populate field "Mobile Number" with "0413782387"
    When I populate field "Email" with "abc@test.com"
    When I populate field "State" with "TAS"
    When I populate field "Source" with "Email"
    When I populate field "Notes" with "General notes added"
    #When I click on button "Submit"
    When I click on button "Cancel"
    Then I tear down
