Feature: User_login
  As a User
  I Should be able to login after I signed up.
  Background:
    Given this user is in the database
  | User_name               | password | Level |
  | Kitahara                | 123456789| Admin |
  | The Terminator          | Bernie   | Guest |

  Scenario: Successfully login in
    Given I am on the login page
    When I fill in "User_name" with "Kitahara"
    And I fill in "Password" with "123456789"
    And I press "Login"
    Then I am logged into the front panel
    And I should not see "Fail to login"
  Scenario: Failing login in
    Given I am on the login page
    When I fill in "User name" with "H.Kitahara"
    And I fill in "Password" with "123456789"
    And I press "Login"
    And I should see "Fail to login"