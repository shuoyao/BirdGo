Feature: New user sign up 

	As a new user 
	I want to sign up
	So that i can visit the website using the identity I created this time.

Background: A new user opens up BirdGo and is on sign-up page
	Given I fill in "Username" with "birdygoyoyo"
	And I fill in "Password" with "169RockYoYo"
	And I fill in "E-mail" with "fakeyo@gmail.com"
	And I fill in "Zip Code" with "94704"
	

Scenario: User sign up with invalid username format 
	Given I fill in "Username" with "Admin"
	And I press "Sign Up!"
	Then I should see "Invalid format, Please try again."
	And I should see "Go Back"

Scenario: User sign up with invalid email format
	Given I fill in "E-mail" with "asdad@gmail"
	And I press "Sign Up!"
	Then I should see "Invalid format, Please try again."
	And I should see "Go Back"

Scenario: User sign up successfully
	When I press "Sign up!"
	Then I should see "Thanks for Joining BirdGo! Now go ahead and discover the wild!"
	Then I should see "Go to my homepage"
	When I follow "Go to my homepage"
	Then I should be on the User Homepage
