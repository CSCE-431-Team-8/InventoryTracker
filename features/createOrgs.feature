Feature: Organizations
    As a user 
    So that I can't access all the inventory
    I want to be able to have organizations.

Background: I am signed in and part of an organization

Given I am signed in with provider "google_oauth2"

Given the following organizations exist:
    | name |
    | TAMU |
    | SWE  |

Given I am part of an organization

Scenario: View existing organizations
    When I go to the organizations page
    And I should see "New Organization"
    And I should see "SWE"

Scenario: Create new organizations
    When I go to the organizations page
    And I should see "New Organization"
    And I click on 'New Organization'
    And I fill in "organization_name" with "Comp Sci"
    And I press "Create Organization"
    And I go to the organizations page
    Then I should see "Comp Sci"