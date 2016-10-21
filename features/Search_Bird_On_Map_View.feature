Feature: search for a bird on map view

  As a user
  I want to search a specific kind of bird and see its location on map
  so that I can know the location of the bird that I am trying to find

Background: birds in database

  Given the following birds exist:
  | name         | last_seen  | locationX | locationY
  | Im so Cool   | 1971-03-11 | 1.0       | 5.0
  | Im cooler    | 1971-03-12 | 2.0       | 6.0
  | Im cooler    | 1971-03-13 | 2.0       | 6.0
  | Coolest      | 1971-03-14 | 3.0       | 7.0
  | Zeus         | 2016-03-11 | 4.0       | 8.0

Scenario: search for a bird
  When I am on the explore page
  And  I fill in "search" with "Im cooler"
  And  I press "Search"
#  And  I can see dropdown hint with an entry of "Im so Cool" in it
#  And  I press "Im so Cool"
  And I can see 2 pin on the map
#For test purpose. Actual original feature is as below.
#  And  I am on the a pin place where "Im so Cool" is shown 

