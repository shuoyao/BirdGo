class Wishlist < ActiveRecord::Base
  has_and_belongs_to_many :birds
  belongs_to :user
  serialize :bird_ids, Array
  serialize :seens, Array
  
  def add_bird(bird)
    if !self.birds.exists?(bird.get_id)
      self.birds << bird
      self.bird_ids << bird.get_id
      self.seens << false
    end
    self.save
  end
  
  def see_bird(bird)
    for i in 0..self.bird_ids.length-1
      if self.bird_ids[i] == bird.get_id
        self.seens[i] = true
      end
    end
    self.save
  end
  
  def remove_bird(bird)
    self.birds.delete(bird)
    for i in 0..self.bird_ids.length-1
      if self.bird_ids[i] == bird.get_id
        self.bird_ids.delete_at(i)
        self.seens.delete_at(i)
        break
      end
    end
    self.save
  end
end
