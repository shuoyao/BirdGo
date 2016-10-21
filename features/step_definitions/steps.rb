#Add some declartive step here for our birdGo#
#Feel the bird! --H.Kitahara#
Given /the following birds exist:/ do |birds_table|
  birds_table.hashes.each do |bird|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Bird.create(bird)
  end
end

Given /the following users exist:/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create(user)
  end
end

Given /^I can see (a|.*) pin on the map$/ do |number|
  if number == "a"
    number = 1
  else
    number = number.to_i
  end
  hidden_field = find :xpath, "//input[@id='search_result']"
  j = hidden_field.value.split("}, {")
  expect(j.length).to equal number
end

When /^within "(.*)", (?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |scope, field, value|
  within(scope) do
    fill_in(field, :with => value)
  end
end