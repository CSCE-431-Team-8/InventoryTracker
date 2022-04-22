Feature: Log into the website
    As a user 
    So that I can have user specific details
    I want to be able to log in with my account


Given I am signed in with provider "google_oauth2"

Scenario: Log in as a new user
    When I go to the login page
    And I should see "Login with Google"
    When I press "Login with Google"
    Then I should be on the inventory page
    # tamusimpleuser@gmail.com
    # tamucsce438