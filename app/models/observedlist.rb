class Observedlist < ActiveRecord::Base
  has_and_belongs_to_many :birds
  belongs_to :user
end
