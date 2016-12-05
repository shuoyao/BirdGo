class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wishlists
  has_one :observedlist
  before_create :create_obs
  
  def get_id()
    return self.id
  end
  
  private
    def create_obs
      self.observedlist = Observedlist.create({user_id: self.id})
      true
    end
end