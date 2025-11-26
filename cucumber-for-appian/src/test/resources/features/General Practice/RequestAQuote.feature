@SMB
Feature: Sample feature file that interacts with an Appian application2

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-testanz.orix.com.au/suite/?signin=native"
    And I set appian version to "25.3"
    And I set appian locale to "en_GB"
    Given I login with username "kailum@lendcofinance.com.au" and password "ORIX@2025"

  Scenario: Navigate to Request a Quote window from Dashboard
    When I click on button "Request a Quote"

    #Select a Client
    When I populate field "Search Journeys" with "KUONE CONSULTING PTY LTD"
    When I click on button "Search[2]"
    #When I populate dropdown "CLIENT NAME" search box with "CAIN, TRAVIS"


    #Select the type of asset are you seeking to finance?
    #When I select grid "[2]" row "[1]"
    When I select grid "[2]" row "[1]"
    When I click on button "Next"
    When I click on text "Passenger or Light Commercial Vehicle"
    When I click on text "Yes"
    When I click on text "Yes, it is for a new asset"

    #Select a Product
    When I click on text "Chattel Mortgage"

    # Fill Quote Information form
    When I populate dropdown "Asset Category" search box with "Irrigation"
    When I populate field "Asset Description" with "Medical Equipements"
    When I populate field "Total Asset Cost (incl. GST)" with "$15,000.00"
    When I populate field "Deposit Amount" with "$5,000.00"
    When I populate field "Dealer Origination Fee (excl. GST)" with "$250.00"
    When I populate field "Deposit Amount" with "$250.00"
    When I populate field "Brokerage % (excl. GST)" with "2.00%"
    When I populate field "Balloon %" with "0.00%"
    When I click on radio option "Monthly in Advance"

    #Selecting a term '24 months'
    Then I click on card "24 months"
    Then I click on button "Next"

    # Fill Quote Information form 2
    Then I populate field type "PNG" named "Quote Document" with "SMB Test image"

    #Optional Values
    Then I populate field "VIN/Serial Number" with "7548458548"
    Then I populate field "Registration Number" with "52325235"
    Then I populate field "Engine Number" with "5325235235"
    Then I populate field "Other Comments" with "Test"
    Then I click on button "Next"

    # Add validation of Indicative Quote Summary

    #Complete Quote after field validation
    Then I click on button "Complete Quote"

