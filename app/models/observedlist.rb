class Observedlist < ActiveRecord::Base
  has_and_belongs_to_many :birds
  belongs_to :user
  
  def add_bird(bird)
    if !self.birds.exists?(bird.get_id)
      self.birds << bird
    end
    self.save
  end
end
