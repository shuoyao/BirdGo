When(/^I click pin at location "([^"]*)", "([^"]*)"$/) do |arg1, arg2|
  #pending # Write code here that turns the phrase above into concrete actions
  Bird.all.each do |bird|
    # return the bird at specific location (assuming no two birds are at the same location for now)
    if bird.locationX == arg1 && bird.locationY == arg2
        @bird = bird
    end
  end
end

When /^(?:|I )could see "([^"]*)"$/ do |text|
    expect(page.body).to include(text)
end

When /^(?:|I )could not see "([^"]*)"$/ do |text|
    expect(page.body).not_to include(text)
end