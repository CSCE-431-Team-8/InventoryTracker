Feature: Search inventory
    As a user 
    So that I can navigate my inventory easier
    I want to be able to search the inventory with keywords

Background: There is a table of items in the inventory page

Given the following items exist:
    | organization | name           | description           | location     | quantity_remaining| quantity_total | rentable | price |
    | TAMU         | golf ball      | ball of golf          | locker       | 3                 |     5        | false    | 10     |
    | TAMU         | tennis ball    | ball of tennis        | ball rack    | 3                 |     5        | false    | 10     |
    | TAMU         | bowling ball   | ball of bowling       | locker       | 3                 |     5        | false    | 10     |
    | TU           | socks          | feet clothes          | dresser      | 1                 |     2        | false    | 10     |

Given the following rented items exist:
    | organization | item_id     | user_renting      | age | date_rented| return_date |
    | TAMU         | 1           | John Doe          | 0.0  | 2022-04-07 | 2022-04-21  |
    | TAMU         | 2           | John Doe          | 0.0  | 2022-04-07 | 2022-04-21  |
    | TAMU         | 3           | John Doe          | 0.0  | 2022-04-07 | 2022-04-21  |
    | TAMU         | 4           | PCR               | 0.0  | 2022-04-07 | 2022-04-21  |
    | TAMU         | 5           | PCR               | 0.0  | 2022-04-07 | 2022-04-21  |
Scenario: Search for tennis ball by name
    When I go to the inventory page
    And I should see "golf ball"
    And I should see "bowling ball"

    And I fill in 'search' with "tennis"
    And I press "Search"
    Then I should see "tennis ball"
    And I should not see "golf ball"
    And I should not see "bowling"

Scenario: Search for tennis ball by description
    When I go to the inventory page
    And I fill in 'search' with "ball of tennis"
    And I press "Search"
    Then I should see "tennis ball"
    And I should not see "golf ball"
    And I should not see "bowling"

Scenario: Search items by description
    When I go to the inventory page
    And I fill in 'search' with "locker"
    And I press "Search"
    Then I should see "golf ball"
    And I should see "bowling ball"
    And I should not see "tennis ball"

Scenario: Search items by organization
    When I go to the inventory page
    And I fill in 'search' with "TAMU"
    And I press "Search"
    Then I should see "golf ball"
    And I should see "bowling ball"
    And I should see "tennis ball"
    And I should not see "socks"
    And I should not see "TU"

Scenario: Search rented items by item id
    When I go to the rented items page
    And I fill in 'search' with "PCR"
    And I press "Search"
    Then I should not see "John Doe"