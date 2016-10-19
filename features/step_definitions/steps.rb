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