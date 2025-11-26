@NotReady
Feature: To validate the different fields & its functionalities in Driver profile section

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-testanz.orix.com.au/suite/sites/customer-hub/?signin=native"
    And I set appian version to "25.2"
    And I set appian locale to "en_GB"
    Given I login with username "dhana.driver@yopmail.com" and password "ORIX@2025"

  Scenario:
    When I click on menu "User Profile"
    #When I click on button "User Profile"
    When I verify field "Salutation" contains "Mrs"
    When I verify field "Legal First Name" contains "Dhana"
    When I verify field "Legal Middle Name" contains ""
    When I verify field "Legal Last Name" contains "Driver"
    When I verify field "Mobile Phone" contains "0421593112"
    When I verify field "Email" contains "dhana.driver@yopmail.com"
    When I verify field "Gross Annual Salary" contains "$9,000,000.00"
    When I verify field "Work Email" contains "dhana.driver@yopmail.com"
    When I verify field "ABN" contains "92109378145"
    When I verify field "Bill To" contains "Orion Health Pty Ltd"
    When I verify field "Your Residential Address *" contains "40 Park Street, Peakhurst NSW 2210"
    Then I tear down
