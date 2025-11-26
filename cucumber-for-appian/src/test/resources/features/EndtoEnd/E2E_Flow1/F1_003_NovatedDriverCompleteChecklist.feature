@Regression @Flow1 @E2E

Feature: E2E - Used Vehicle(Dealer)

  Background: Login to Appian environment
    Given I setup with "CHROME" browser
    When I set appian URL to "https://orion-testanz.orix.com.au/suite/sites/customer-hub/?signin=native"
    And I set appian version to "25.2"
    And I set appian locale to "en_GB"
    Given I login with username "dhana.driver@yopmail.com" and password "ORIX@2025"

  Scenario:Novated Driver complete checklist
    When I click on button "Confirm Insurance Choice"
    When I click on radio option "I request ORIX to arrange Annual Insurance through VERO"
    When I click on button "Next"
    When I click on checkbox option "I confirm that I would like ORIX to arrange the comprehensive insurance policy with VERO."
    When I click on button "Submit"
    When I verify text "Success" is present
    When I verify text "Thank you for completing your Insurance Checklist. We are preparing your Quotation / Order form and will be in contact with you within one working day to provide. This will then be signed by You, your Employer and ORIX so we can place the vehicle order." is present
    When I click on button "CLOSE"
    When I click on button "Complete Prepayment Checklist"
    When I populate field "Tax Invoice" with "C:\Users\Public\Documents\Invoice.pdf"
    When I click on button "Complete form: Delivery Pre-Payment"
    When I click on checkbox option "I coThe seller of this vehicle requires payment prior to delivery. By ticking this box, I instruct and authorise ORIX to make payment to the seller for the vehicle, including full payment, before delivery. I acknowledge that, notwithstanding any provision in the standard terms stating that my financial obligations commence upon delivery, my financial obligations to ORIX will instead commence once ORIX has made payment to the seller, which may occur before I receive the vehicle."
    When I click on button "Accept and Save"
    When I click on button "SUBMIT"
    Then I tear down
