class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wishlists
  has_one :observedlist
  
  def get_id()
    return self.id
  end
  
  def after_initialize(attributes = {}, options = {})
    Observedlist.create({user_id: self.id})
  end
end