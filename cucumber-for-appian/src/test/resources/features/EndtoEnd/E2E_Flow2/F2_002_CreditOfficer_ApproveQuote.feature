@Regression @Flow2 @E2E
Feature: E2E - Used Vehicle(Dealer)

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-testanz.orix.com.au/suite/portal/login.jsp"
    And I set appian version to "25.2"
    And I set appian locale to "en_GB"
    Given I login with username "dhana.creditmanager@yopmail.com" and password "ORIX@2025"

  Scenario:Novated Credit Officer Approve Quote
    When I sort grid "[1]" by column "Last Updated On"
    When I click on button "Request a Quote"
    When I click on text "Used Vehicle Quote"
    When I populate field "Model Year" with "2022"
    When I populate dropdown "Make" search box with "BMW"
    #When I populate dropdown "Model" search box with "3 SERIES"
    When I click on button "Search"
    #Search Vehicle section - Select the vehicle type from the table
    When I click on text "Select[11]"
    #Fill Vehicle Details
    When I populate field "registration valid-to date" with "31/12/2025"
    When I populate field "Dealer Quote / Finance Payout Letter" with "C:\Users\Public\Documents\DealerQuote.pdf"
    When I wait for "4" seconds
    When I populate field type "text" named "Registration Number" with "DCT82F"
    #Current Odometer Reading
    When I populate field type "text" named "[3]" with "88000"
    When I populate field "State" with "NSW"
    When I populate field type "text" named "Registration Valid-to Date" with "31/12/2025"
    When I populate field "First Registered Date" with "31/12/2021"
    When I populate field type "text" named "Current Odometer Reading" with "88000"
    When I populate field "Date of Odometer Reading" with "21/11/2025"
    When I populate field "Build Date" with "31/12/2020"
    When I wait for "4" seconds
    When I populate field "Seller Type" with "Dealer"
    #Total Vehicle Price Including Accessories (excl GST)
    When I populate field type "text" named "[4]" with "60000"
    When I click on radio option "No"
    When I click on radio option "Yes"
    When I populate field "Dealer Delivery Fee" with "500"
    When I populate field "Luxury Car Tax" with "250"
    When I populate field "Stamp Duty / Transfer Fee" with "150"
    When I click on button "Request a Quote[2]"
    
    #Fill personal Details
    When I verify field "Gross Annual Salary" contains value "A$9,000,000.00"
    When I populate field "Salary Payment Frequency" with "Monthly"
    When I populate field "Citizenship Status" with "Australian Citizen"
    When I populate field "Lease Term (Months)" with "24 Months"
    #When I verify field "Tyres" contains value "4"
    When I populate field "State" with "NSW"
    #When I verify field "Postcode" contains value "2210"
    When I populate field "Insurance" with "ORIX Arranged (Vero)"
    #When I verify field "Delivery Option" contains value "Pick-up"
    When I populate field "When is the vehicle required?" with "30/11/2025"
    When I click on button "Submit"
    When I wait for progress bar
    Then I tear down
