class Bird < ActiveRecord::Base
  has_and_belongs_to_many :pins
  
  def get_id
      return self.id
  end
end
