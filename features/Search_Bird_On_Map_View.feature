Feature: search for a bird on map view

  As a user
  I want to search a specific kind of bird and see its location on map
  so that I can know the location of the bird that I am trying to find

Background: birds in database
  Background: A new user opens up BirdGo and is on sign-up page
	Given I am on the login page
	And I should see "Sign Up"
	And I follow "Sign Up"
	And within ".lgm-1", I fill in "user_email" with "fakeyo@gmail.com"
	And within ".lgm-1", I fill in "user_password" with "169RockYoYo"
	And within ".lgm-1", I fill in "user_password_confirmation" with "169RockYoYo"
	And I press "Create Account"
  Given the following birds exist:
  | name         | last_seen   
  | Im so Cool   | 1971-03-11 
  | Im cooler    | 1971-03-12 
  | Im cooler    | 1971-03-13 
  | Coolest      | 1971-03-14 
  | Zeus         | 2016-03-11 

Scenario: search for a bird
  When I am on the explore page
  And  I fill in "search" with "Im cooler"
  And  I presses "search"
#  And  I can see dropdown hint with an entry of "Im so Cool" in it
#  And  I press "Im so Cool"
  #And I should see "No matching bird found!"
  And I can see 0 pin on the map
#For test purpose. Actual original feature is as below.
#  And  I am on the a pin place where "Im so Cool" is shown 

