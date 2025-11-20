@Application1
Feature: feature file that creates a New Quote in Customer-Hub as an Driver

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-devanz.orix.com.au/suite/?signin=native"
    And I set appian version to "25.2"
    And I set appian locale to "en_GB"
    Given I login with username "nath.thompson85@gmail.com.test" and password "ORIX@2025"

  Scenario:
    When I click on button "Request a Quote"

    #Select type of quote
    When I click on text "ORIX New Vehicle Quote"
    When I populate dropdown "Make" search box with "HYUNDAI"
    When I wait for "10" seconds
    #When I populate dropdown "Model[2]" search box with "KONA"
    When I click on button "Search"

    #Seacrh Vehicle section - Select the vehicle type from the table
    When I wait for "7" seconds
    When I click on text "Select[13]"
    When I wait for "14" seconds
    #When I populate field "Colour" with "Atlas White solid"
    When I click on button "Request a Quote[2]"

    #Fill Personal Details
    When I populate field "Gross Annual Salary" with "$9,000,000.00"
    When I populate field "Salary Payment Frequency" with "Monthly"
    When I populate field "Citizenship Status" with "Australian Citizen"
    When I populate field "Lease Term (Months)" with "24 Months"
    When I populate field "Kilometres Per Annum" with "20,000 KM"
    When I populate field "Insurance" with "ORIX Arranged (Vero)"
    When I populate field "When is the vehicle required?" with "14/11/2025"
    When I click on button "Submit"
    When I wait for progress bar
    When I wait for "10" seconds
    Then I tear down
