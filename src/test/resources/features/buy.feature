Feature: Buy products
    As a customer
    I want to buy products

Background:
    Given the store is ready to service customers
    And a product "Bread" with price 20.50 and stock of 5 exists
    And a product "Jam" with price 80.00 and stock of 10 exists
    And a product "Candy" with price 20.00 and stock of 10 exists

Scenario: Buy one product
    When I buy "Bread" with quantity 2
    Then total should be 41.00

Scenario: Buy multiple products
    When I buy "Bread" with quantity 2
    And I buy "Jam" with quantity 1
    Then total should be 121.00

Scenario Outline: Buy one product in table
   When I buy <product> with quantity <quantity>
   Then total should be <total>
   Then total stock of <product> should be <stock>
   Examples:
       | product  | quantity |  total  |  stock  |
       | "Bread"  |     1    |   20.50 |    4    |
       | "Jam"    |     2    |  160.00 |    8    |
       | "Candy"  |     2    |   40.00 |    8    |

Scenario: Buy one product
    When I buy "Candy" with quantity 2
    Then total stock of "Candy" should be 8