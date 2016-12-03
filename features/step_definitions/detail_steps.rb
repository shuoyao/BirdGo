When(/^I click pin at location "([^"]*)", "([^"]*)"$/) do |arg1, arg2|
  #pending # Write code here that turns the phrase above into concrete actions
  Pin.all.each do |pin|
    # return the bird at specific location (assuming no two birds are at the same location for now)
    if pin.locationX == arg1 && pin.locationY == arg2
        @pin = pin
    end
  end
end

When /^(?:|I )could see "([^"]*)"$/ do |text|
    expect(page.body).to include(text)
end
