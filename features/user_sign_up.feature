Feature: New user sign up and log in

	As a new user 
	I want to sign up or Log in
	So that i can visit the website using the identity I created this time.

Background: A new user opens up BirdGo and is on sign-up page
	Given I click "SIGN UP"
	And I fill in "E-mail" with "fakeyo@gmail.com"
	And I fill in "Password" with "169RockYoYo"
	And I fill in "Repeat Password" with "169RockYoYo"

Scenario: User sign up with invalid email format
	Given I fill in "E-mail" with "asdad@gmail"
	And I press "Create Account"
	Then I should see "Invalid Email"

Scenario: User sign up successfully
	When I press "Create Account"
	Then I should see "Welcome! You have signed up successfully"

Scenario: Successfully login in
    Given I am on the login page
    And I click "LOGIN"
    When I fill in "Email" with "fakeyo@gmail.com"
    And I fill in "Password" with "169RockYoYo"
    And I press "Log In"
    And I should see "Signed in successfully"
    
Scenario: Failing login in
    Given I am on the login page
    And I click "LOGIN"
    When I fill in "Email" with "fakeyo@gmail.com"
    And I fill in "Password" with "123456789"
    And I press "Log In"
    And I should see "Fail to login"