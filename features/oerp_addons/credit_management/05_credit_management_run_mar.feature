###############################################################################
#
#    OERPScenario, OpenERP Functional Tests
#    Copyright 2012 Camptocamp SA
#    Author Nicolas Bessi
##############################################################################

# Features Generic tags (none for all)
##############################################################################

@credit_management      @credit_management_run_mar

Feature: Ensure that mail credit line generation first pass is correct

  @credit_management_first_run
  Scenario: Create run
    Given I need a "credit.management.run" with oid: credit_management.run1
    And having:
      | name |      value |
      | date | 2012-02-28 |
    When I launch the credit run
    Then my credit run should be in state "done"
    And credit lines should have following values:
     | balance |   date due | account       | profile       |       date | partner            | canal | level | move line     | profile rule            | state | amount due | currency |
     |    1000 | 2012-02-29 | Debtors       | 2 time policy | 2012-03-31 | customer_2         | mail  |  1.00 | SI_4          | 30 days end of month    | draft |       360  |  USD     |
     |    1000 | 2012-02-17 | Debtors       | 2 time policy | 2012-03-31 | customer_3         | mail  |  1.00 | SI_7          | 30 days end of month    | draft |      1000  |          |
     |     700 | 2012-02-29 | Debtors       | 3 time policy | 2012-03-31 | customer_4         | mail  |  1.00 | SI_10         | 10 days net             | draft |       700  |          |
     |     450 | 2012-03-15 | Debtors       | 3 time policy | 2012-03-31 | customer_4         | mail  |  1.00 | SI_12         | 10 days net             | draft |       450  |   USD    |
     |    1200 | 2012-03-16 | Debtors USD   | 3 time policy | 2012-03-31 | customer_5_usd     | mail  |  1.00 | SI_14         | 10 days net             | draft |      1200  |   USD    |
     |     360 | 2012-02-15 | Debtors       | 3 time policy | 2012-03-31 | customer_4         | mail  |  2.00 | SI_11         | 10 days net             | draft |       360  |   USD    |
     |    1000 | 2012-02-17 | Debtors USD   | 3 time policy | 2012-03-31 | customer_5_usd     | mail  |  2.00 | SI_13         | 10 days net             | draft |      1000  |   USD    |
     |     300 | 2012-01-18 | Debtors       | 3 time policy | 2012-03-31 | customer_4         | mail  |  3.00 | SI_10         | 10 days net             | draft |       300  |          |                        