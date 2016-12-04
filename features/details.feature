Feature: User want to see details of a bird pinned
  User need to click on the pin and it shows details about the bird
  
Background: Birds have been added to database
	Given I am on the login page
	And I should see "Sign Up"
	And I follow "Sign Up"
	And within ".lgm-1", I fill in "user_email" with "fakeyo@gmail.com"
	And within ".lgm-1", I fill in "user_password" with "169RockYoYo"
	And within ".lgm-1", I fill in "user_password_confirmation" with "169RockYoYo"
	And I press "Create Account"
   Given the following birds exist:
     | name  | last_seen | frequency | wiki-link
     | wigeon| 09/19/16  | 10        | https://en.wikipedia.org/wiki/Wigeon
     | duck  | 10/19/16  | 2         | https://en.wikipedia.org/wiki/Duck
    
  Given the following pins exist:
      |name   | bird  | locationX |  locationY 
      |alpha  | wigeon| 36.778259 |-119.417931
      |beta   | duck  | 39.124578 |-132.346678 

Scenario: See birds on the certain area
  When I am on the explore page
  And I click pin at location "36.778259", "-119.417931"
  Then show me everything on page
  Then I could see "wigeon"
  And I could see "duck"
  And I could see "10"
  # And I could see "09/19/16"
  # And I could see "https://en.wikipedia.org/wiki/Wigeon"
   
# Scenario: Move map and see updated birds on the area
#   When I click pin at location "39.124578", "-132.346678"
#   And I am on the detail page
#   Then I could not see "wigeon"
#   And I could see "duck"
#   And I could see "2"
#   And I could see "10/19/16"
#   And I could see "https://en.wikipedia.org/wiki/Duck"
  