Feature: Rent Items
    As a user 
    So that I can temporarily check out items from the inventory
    I want to be able to rent out items

Background: There is a table of items in the inventory page

Given the following rented items exist:
    | organization | item_id     | user_renting      | age | date_rented| return_date |
    | TAMU         | 1           | Jireh John Ferrer | 0.0  | 2022-04-07 | 2022-04-21  |

Given the following items exist:
    | organization | name     | description | location | quantity_remaining| quantity_total | rentable | price |
    | TAMU         | golf ball   | ball of golf      | locker   | 5                  |     5        | false    | 10     |


Scenario: Rent out an item

    When I go to the login page
    When I go to the inventory page
    And I should see "golf ball"
    And I should see "Rent"

    # Must be signed into oAUTH
    # When I click on 'Rent'

    When I go to the rented items page
    # Must flesh out rental testing
    Then I should see "1"