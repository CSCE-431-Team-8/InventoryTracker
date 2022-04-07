Feature: Delete an item from inventory
    As a user 
    So that I can remove certain items from the inventory 
    I want to be able to delete items from the inventory

Background: There is a table of items in the inventory page

Given the following items exist:
    | organization | name     | description | location | quantity_remaining| quantity_total | rentable | price |
    | TAMU         | golf ball   | ball of golf      | locker   | 5                  |     5        | false    | 10     |


Scenario: Delete an existing item
    When I go to the inventory page
    And I should see "golf ball"
    And I should see "5.0/5.0"
    When I remove an item
    Then I should see "4.0/5.0"