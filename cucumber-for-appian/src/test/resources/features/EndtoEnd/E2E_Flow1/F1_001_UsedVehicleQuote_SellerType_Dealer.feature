@Regression @Flow1 @E2E

Feature: E2E - Used Vehicle(Dealer)

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-testanz.orix.com.au/suite/sites/customer-hub/?signin=native"
    And I set appian version to "25.2"
    And I set appian locale to "en_GB"
    Given I login with username "dhana.driver@yopmail.com" and password "ORIX@2025"

  Scenario:Novated Driver creates a new Quote for a Used Vehicle (Seller Type - Dealer)
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
    When I populate field "Kilometres Per Annum" with "20,000 KM"
    When I wait for "2" seconds
    #When I verify field "Tyres" contains value "4"
    When I populate field "State" with "NSW"
    #When I verify field "Postcode" contains value "2210"
    When I populate field "Insurance" with "ORIX Arranged (Vero)"
    #When I verify field "Delivery Option" contains value "Pick-up"
    When I populate field "When is the vehicle required?" with "30/11/2025"
    When I wait for "4" seconds
    When I click on button "Submit"
    When I wait for progress bar

    #Proceed Quote
    When I click on button "Proceed quote"
    When I click on text "New Application"
    When I click on text "I am looking for more than one vehicle or my financial information has changed since my first application."
    When I wait for "4" seconds
    When I populate field "Please select an application to clone:" with "APP-1166"
    When I click on button "CONFIRM"
    When I wait for progress bar
    When I click on button "Begin Application"
    #Add steps to verify details
    When I click on button "NEXT"
    When I click on button "NEXT"
    When I click on button "NEXT"
    When I click on button "NEXT"
    When I click on button "SUMMARY"
    When I click on button "CONTINUE"
    When I click on checkbox option "I consent to ORIX collecting, using and disclosing my Credit Related Personal Information (consumer and/or commercial credit related information) for the purposes as set out in the Privacy Collection Notice - Applications and Credit Reporting Collection Notice, including to obtain such information from, and to provide these to CRBs, other credit providers (and in the case of debt collectors, for the primary purpose of such debt collectors collecting payments that are overdue in relation to commercial credit provided by ORIX)."
    When I click on checkbox option "I confirm I am authorised to provide the personal details presented and I consent to my information being checked with the document issuer or official record holder via third party systems for the purpose of confirming my identity."
    When I click on button "SUBMIT"
    #When I populate field "Rates Notice" with "C:\Users\Public\Documents\RatesNotice.pdf"
    When I click on button "SUBMIT"
    When I wait for progress bar
    Then I tear down
