class Wishlist < ActiveRecord::Base
  has_and_belongs_to_many :birds
  belongs_to :user
  serialize :bird_ids, Array
  serialize :seens, Array
end
