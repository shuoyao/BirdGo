Feature: User want to see details of a bird pinned
  User need to click on the pin and it shows details about the bird
  
Background: Birds have been added to database
   Given the following birds exist:
    | locationX |  locationY | name  | frequency                 | wiki-link
    | 36.778259 |-119.417931 | wigeon| 10                        | https://en.wikipedia.org/wiki/Wigeon
    | 39.124578 |-132.346678 | duck  | 2                         | https://en.wikipedia.org/wiki/Duck
    And I am on the Birdgo map page

Scenario: See birds on the certain area
  When I click pin at location "36.778259, -119.417931"
  Then I should see "wigeon"
  And I should not see "duck"
  And I should see "10"
  And I should see "https://en.wikipedia.org/wiki/Wigeon"
   
Scenario: Move map and see updated birds on the area
  When I click pin at location "39.124578, -132.346678"
  Then I should not see "wigeon"
  And I should see "duck"
  And I should see "2"
  And I should see "https://en.wikipedia.org/wiki/Duck"