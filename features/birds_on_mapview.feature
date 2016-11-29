Feature: see birds on map view
  
    As a user
    I want to see birds' location on a map view
    so that I can know the location of nearby birds
  
Background: Birds have been added to database
  
  Background: A new user opens up BirdGo and is on sign-up page
	Given I am on the login page
	And I should see "Sign Up"
	And I follow "Sign Up"
	And within ".lgm-1", I fill in "user_email" with "fakeyo@gmail.com"
	And within ".lgm-1", I fill in "user_password" with "169RockYoYo"
	And within ".lgm-1", I fill in "user_password_confirmation" with "169RockYoYo"
	And I press "Create Account"
    Given the following birds exist:
    | name  | 
    | wigeon|
    | duck  |
    Given the following pins exist:
    |name   | bird  | locationX | locationY |
    |alpha  | wigeon|  36       |   -119    |
    |beta   | duck  |  39       |   -132    |
    And I am on the Birdgo map page

Scenario: See birds in the certain area
  When I set the map at location "36, -119"
  Then I should see "alpha"
  And I should not see "beta"
   

Scenario: Move map and see updated birds in the area
  When I move map to "39, -132"
  Then I should not see "alpha"
  And I should see "beta"

    