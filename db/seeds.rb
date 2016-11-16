# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
birds = Bird.create([{name: 'Canada goose', wiki_link: "https://en.wikipedia.org/wiki/Canada_goose", frequency: 10, last_seen: Date.new(2016, 11, 11)},
                     {name: 'Red-tailed hawk', wiki_link: "https://en.wikipedia.org/wiki/Red-tailed_hawk", frequency: 15, last_seen: Date.new(2008, 4, 17)},
                     {name: 'Western gull', wiki_link: "https://en.wikipedia.org/wiki/Western_gull", frequency: 20, last_seen: Date.new(2016, 11, 1)},
                     {name: 'Barn owl', wiki_link: "https://en.wikipedia.org/wiki/Barn_owl", frequency: 30, last_seen: Date.new(2015, 1, 1)}])
birds.each do |bird|
    pins = Pin.create([{name: bird.name + ' 1', bird_id: bird.id, locationX: Random.rand(100.0), locationY: Random.rand(50.0)},
                      {name: bird.name + ' 2', bird_id: bird.id, locationX: Random.rand(100.0), locationY: Random.rand(50.0)},
                      {name: bird.name + ' 3', bird_id: bird.id, locationX: Random.rand(100.0), locationY: Random.rand(50.0)},
                      {name: bird.name + ' 4', bird_id: bird.id, locationX: Random.rand(100.0), locationY: Random.rand(50.0)}])
end
user = User.new(:email => "test@test.com", :password => "pwdhhh", :password_confirmation => "pwdhhh")
user.save!
Wishlist.create({name: "wishlist1", user_id: user.id, bird_ids: [birds.first.id, birds.second.id], seens: [true, false]})
Wishlist.create({name: "wishlist2", user_id: user.id, bird_ids: [birds.first.id, birds.last.id], seens: [true, true]})