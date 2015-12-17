Feature:

# Scenario: Navigate to second screen
#   Given I am on the first screen
#    When I go to the second screen
#    Then I should see the second screen's label
#
# Scenario: Navigate to first screen
#   Given I am on the second screen
#    When I go to the first screen
#    Then I should see the first screen's label
#
# Scenario: Navigate to third screen
#   Given I am on the first screen
#    When I go to the third screen
#    Then I should see the text tableview
#
# Scenario: Alert with my name
#   Given I am on the first screen
#    When I enter my name
#     And I show the alert
#    Then I should see the alert with my name

Scenario: Alert with my name
 Given I am on the third screen
  When I tap on the cell containing "Text 3"
  Then the cell containing "Text 3" should be selected
