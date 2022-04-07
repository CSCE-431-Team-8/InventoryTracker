Feature: Edit item quantity
    As a user 
    So that I can change the stock in the inventory
    I want to be able to increase and decrease the quantity of an item

Background: There is a table of items in the inventory page

Given the following items exist:
    | organization | name     | description | location | quantity_remaining| quantity_total | rentable | price |
    | TAMU         | golf ball   | ball of golf      | locker   | 3                  |     5        | false    | 10     |

Scenario: Increment the item quantity by one
    When I go to the inventory page
    And I should see "3.0/5.0"

    # Button error
    #And I follow "Increase"
    #Then I should see "4.0/5.0"