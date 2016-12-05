Feature: New user sign up and log in

	As a new user 
	I want to sign up or Log in
	So that i can visit the website using the identity I created this time.

Background: A new user opens up BirdGo and is on sign-up page
	Given I am on the login page
	And I should see "Sign Up"
	And I follow "Sign Up"
	And within ".lgm-1", I fill in "user_email" with "fakeyo@gmail.com"
	And within ".lgm-1", I fill in "user_password" with "169RockYoYo"
	And within ".lgm-1", I fill in "user_password_confirmation" with "169RockYoYo"

Scenario: User sign up with invalid email format
	Given within ".lgm-1", I fill in "user_email" with "asdad"
	And I press "Create Account"
	Then I should see "Email is invalid"

Scenario: User sign up successfully
	When I press "Create Account"
	Then I should see "success"

Scenario: Successfully login in
	When I press "Create Account"
	Then I should see "success"
	And I follow "Log Out"
	Given I am on the login page
    And I follow "LOGIN"
    When within ".lgm-2", I fill in "user_email" with "fakeyo@gmail.com"
    And within ".lgm-2", I fill in "user_password" with "169RockYoYo"
    And I press "Log In"
    And I should not see "Invalid Email or password."
    
Scenario: Failing login in
    Given I am on the login page
    And I follow "LOGIN"
    When within ".lgm-2", I fill in "user_email" with "fakeyo@gmail.com"
    And within ".lgm-2", I fill in "user_password" with "123456789"
    And I press "Log In"
    And I should see "Invalid Email or password."