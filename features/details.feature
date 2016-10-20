Feature: User want to see details of a bird pinned
  User need to click on the pin and it shows details about the bird
  
Background: Birds have been added to database
   Given the following birds exist:
    | locationX |  locationY | name  | last_seen | frequency | wiki-link
    | 36.778259 |-119.417931 | wigeon| 09/19/16  | 10        | https://en.wikipedia.org/wiki/Wigeon
    | 39.124578 |-132.346678 | duck  | 10/19/16  | 2         | https://en.wikipedia.org/wiki/Duck
    

Scenario: See birds on the certain area
  When I am on the detail page
  And I click pin at location "36.778259", "-119.417931"
  Then show me everything on page
  Then I could see "wigeon"
  And I could not see "duck"
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
  