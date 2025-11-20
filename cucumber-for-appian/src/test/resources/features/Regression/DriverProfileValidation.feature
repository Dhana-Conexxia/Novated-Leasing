@NotReady
Feature: To validate the different fields & its functionalities in Driver profile section

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-testanz.orix.com.au/suite/sites/customer-hub/?signin=native"
    And I set appian version to "25.2"
    And I set appian locale to "en_GB"
    Given I login with username "dhana.driver@yopmail.com" and password "ORIX@2025"

  Scenario:
    When I click on button "Request a Quote"
    #Select type of quote
    When I click on text "Used Vehicle Quote"
    When I populate field "Model Year" with "2022"
    When I populate dropdown "Make" search box with "BMW"
    When I wait for "7" seconds
    When I populate dropdown "Model" search box with "3 SERIES"
    When I click on button "Search"
    #Seacrh Vehicle section - Select the vehicle type from the table
    When I wait for "3" seconds
    When I click on text "Select[9]"
    #Fill Vehicle Details
    When I populate field type "text" named "Registration Number" with "DCT82F"
    When I populate field "State" with "NSW"
    When I populate field type "text" named "Current Odometer Reading" with "88000"
    When I click on button "Cancel"
    Then I tear down
