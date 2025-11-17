@Application1
Feature: feature file that creates a New Quote in Customer-Hub as an Driver

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-testanz.orix.com.au/suite/sites/customer-hub/?signin=native"
    And I set appian version to "25.2"
    And I set appian locale to "en_GB"
    Given I login with username "dhana.driver@yopmail.com" and password "ORIX@2025"

  Scenario: Navigate to Request a Quote window from Dashboard
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
    #When I populate field "Dealer Quote / Finance Payout Letter" with "C:\Users\Public\Documents\DealerQuote.pdf"
    When I wait for "4" seconds
    When I populate field type "text" named "Registration Number" with "DCT82F"
    When I populate field "State" with "NSW"
    When I populate record type user filter "Registration Valid-to Date" with "31/12/2025"
    When I populate field type "date and time" named "Registration Valid-to Date" with "31/12/2025"
    When I populate field type "text" named "Registration Valid-to Date" with "31/12/2025"
    When I populate field "First Registered Date" with "31/12/2021"
    When I populate field type "text" named "Current Odometer Reading" with "88000"
    #When I populate field "Date of Odometer Reading" with "Today"
    #When I populate field "Build Date" with "31/12/2020"
    When I wait for "4" seconds
    When I populate field "Seller Type" with "Dealer"
    When I populate field type "text" named "Total Vehicle Price Including Accessories (excl GST)" with "60000"
    When I click on button "Request a Quote[2]"

    When I wait for progress bar
    Then I tear down


  #//div[contains(@class, 'DropdownWidget---dropdown_value') or contains(@class, 'DateRangeWidget---dropdown_value') or contains(@class,'DatePickerWidget')]/descendant::input[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÜÑÇ','abcdefghijklmnopqrstuvwxyzáéíóúüñç'),'registration valid-to date')]