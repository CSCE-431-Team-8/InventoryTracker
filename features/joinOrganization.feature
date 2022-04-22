Feature: Join an organization
  As a user
  So I can be a part of something bigger than me
  I want to to be able to join an organization

Background: There is a table of Organizations

Given the following organizations exist:
    | name |
    | TAMU |

Given the following items exist:
    | name     | description | location | quantity_remaining| quantity_total | rentable | price           | organization_id |
    | golf ball   | ball of golf      | locker   | 5                  |     5        | false    | 10     | 1                |
    | soccer ball   | ball of socker      | locker   | 5                  |     5        | false    | 10     | 2              |

Scenario: Join organization
    When I go to the organizations page
    And I am on the organizations page
    And I should see "TAMU"

    #And I click on "Join"
    And I am part of an organization
    When I go to the inventory page
    Then I should see "ball"
