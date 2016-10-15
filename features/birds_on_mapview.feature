Feature: see birds on map view
  
    As a user
    I want to see birds' location on a map view
    so that I can know the location of nearby birds
  
Background: Birds have been added to database
   Given the following birds exist:
    | location               | name  | 
    | 36.778259, -119.417931 | wigeon|
    | 39.124578, -132.346678 | duck  |
    
    And I am on the Birdgo map page


Scenario: See birds in the certain area
  When I set the map at location "36.778259, -119.417931"
  Then I should see "wigeon"
  Then I should not see "duck"
   
Scenario: Move map and see updated birds in the area
  When I move map to "39.124578, -132.346678"
  Then I should not see "wigeon"
  Then I should see "duck"

    