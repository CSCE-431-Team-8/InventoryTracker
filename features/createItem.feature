Feature: View inventory page

  As a user
  So that I can find the items in the inventory
  I want to be able to see the properties of my items

Background: There is a table of items in the inventory page

Given the following items exist:
    | organization | name     | description | location | quantity_remaining| quantity_total | rentable | price |
    | TAMU         | golf ball   | ball of golf      | locker   | 5                  |     5        | false    | 10     |

    # t.string 'organization'
    # t.string 'name'
    # t.text 'description'
    # t.string 'location'
    # t.decimal 'quantity_remaining'
    # t.decimal 'quantity_total'
    # t.boolean 'rentable'
    # t.float 'price'

Scenario: View item
  When I go to the inventory page 
    # "I go to" = web steps | "the inventory page" = paths

    And I am on the inventory page
    And I should see "Inventory"
    Then I should see "golf ball"

# Scenario
# Create the "whens" -> Make paths/check paths