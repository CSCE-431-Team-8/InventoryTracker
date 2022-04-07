Feature: Create Items
    As a user 
    So that I can add certain items to the inventory 
    I want to be able to create items

Background: There is a table of items in the inventory page

Given the following items exist:
    | organization | name     | description | location | quantity_remaining| quantity_total | rentable | price |
    | TAMU         | golf ball   | ball of golf      | locker   | 5                  |     5        | false    | 10     |


Scenario: Add a new non-rentable item
    When I go to the inventory page
    And I should see "New Item"
    And I should not see "tennis ball"
    When I click on "New Item"
    Then I should see "New Item"

    When I fill in 'item_name' with "tennis ball"
    When I fill in 'item_description' with "a ball for tennis"
    When I fill in 'item_quantity_remaining' with "5"
    When I fill in 'item_quantity_total' with "5"
    
    When I press "Create Item"

    And I am on the inventory page
    Then I should see "tennis ball"


Scenario: Add a new item without name
    When I go to the inventory page
    And I should see "New Item"
    And I should not see "tennis ball"
    When I click on "New Item"
    Then I should see "New Item"

    # MISSING ITEM NAME 
    When I fill in 'item_description' with "a ball for tennis"
    When I fill in 'item_quantity_remaining' with "5"
    When I fill in 'item_quantity_total' with "5"
    
    When I press "Create Item"
    Then I should see "Name can't be blank"

Scenario: Add a new item without quantity total
    When I go to the inventory page
    And I should see "New Item"
    And I should not see "tennis ball"
    When I click on "New Item"
    Then I should see "New Item"

    When I fill in 'item_name' with "tennis ball"
    When I fill in 'item_description' with "a ball for tennis"
    When I fill in 'item_quantity_remaining' with "5"
    # When I fill in 'item_quantity_total' with "5"
    
    When I press "Create Item"

    Then I should see "Quantity total is not a number"

Scenario: Add a new item without quantity remaining
    When I go to the inventory page
    And I should see "New Item"
    And I should not see "tennis ball"
    When I click on "New Item"
    Then I should see "New Item"

    When I fill in 'item_name' with "tennis ball"
    When I fill in 'item_description' with "a ball for tennis"
    # When I fill in 'item_quantity_remaining' with "5"
    When I fill in 'item_quantity_total' with "5"
    
    When I press "Create Item"

    Then I should see "Quantity remaining can't be blank"