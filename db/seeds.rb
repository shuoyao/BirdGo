# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
birds = Bird.create([{name: 'Canada goose'}, {name: 'Red-tailed hawk'}, {name: 'Western gull'}, {name: 'Barn owl'}])
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