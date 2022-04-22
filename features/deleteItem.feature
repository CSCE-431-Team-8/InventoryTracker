Feature: Delete an item from inventory
    As a user 
    So that I can remove certain items from the inventory 
    I want to be able to delete items from the inventory

Background: I am signed in and part of an organization and there are items in the list

Given I am signed in with provider "google_oauth2"

Given the following organizations exist:
    | name |
    | TAMU |
    | SWE  |

Given I am part of an organization

Given the following items exist:
    | name     | description | location | quantity_remaining| quantity_total | rentable | price           | organization_id |
    | golf ball   | ball of golf      | locker   | 5                  |     5        | false    | 10     | 1                |
    | soccer ball   | ball of socker      | locker   | 5                  |     5        | false    | 10     | 2              |
    | tennis ball   | ball of socker      | locker   | 5                  |     5        | false    | 10     | 2              |

Scenario: Try to delete an item not as admin
    When I go to the inventory page
    And I should see "golf ball"
    When I click on 'Show'
    Then I should not see "Remove"

Scenario: Delete an item as an administrator
    When I go to the memberships page
    Then I should see "TAMU"
    And I click on 'Edit'
    And I check "membership[admin]"
    And I press "Update Membership"

    When I go to the inventory page
    When I click on 'Show'
    Then I should see "Remove"
    
    # Press remove and handle dialog box
    # Should not see item