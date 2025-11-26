@Regression @Ready
Feature: Novated Driver - Proceed Quote

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-testanz.orix.com.au/suite/sites/customer-hub/?signin=native"
    And I set appian version to "25.2"
    And I set appian locale to "en_GB"
    Given I login with username "dhana.driver@yopmail.com" and password "ORIX@2025"

  Scenario:Proceed Quote
    #Proceed Quote
    When I click on button "Proceed quote"
    When I click on text "New Application"
    When I click on text "I am looking for more than one vehicle or my financial information has changed since my first application."
    When I wait for "2" seconds
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
    When I wait for "2" seconds
    When I click on checkbox option "[1]"
    When I click on checkbox option "[2]"
    #When I click on checkbox option "I consent to ORIX collecting, using and disclosing my Credit Related Personal Information (consumer and/or commercial credit related information) for the purposes as set out in the Privacy Collection Notice - Applications and Credit Reporting Collection Notice, including to obtain such information from, and to provide these to CRBs, other credit providers (and in the case of debt collectors, for the primary purpose of such debt collectors collecting payments that are overdue in relation to commercial credit provided by ORIX)."
    #When I click on checkbox option "I confirm I am authorised to provide the personal details presented and I consent to my information being checked with the document issuer or official record holder via third party systems for the purpose of confirming my identity."
    When I click on button "SUBMIT"
    #When I populate field "Rates Notice" with "C:\Users\Public\Documents\RatesNotice.pdf"
    When I click on button "SUBMIT"
    When I wait for progress bar
    Then I tear down
