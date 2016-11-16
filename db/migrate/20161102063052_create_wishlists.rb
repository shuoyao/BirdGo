class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.text :bird_ids # For some mysterious reason cannot use integer here.
      t.text :seens # For some mysterious reason cannot use boolean here.
      t.timestamps null: false
    end
    
    change_table :birds do |t|
      t.remove :locationX, :locationY
    end
    
    create_table :birds_wishlists, id: false do |t|
      t.belongs_to :wishlist, index: true
      t.belongs_to :bird, index: true
    end
    
    create_table :pins do |t|
      t.string :name
      t.belongs_to :bird
      t.float :locationX
      t.float :locationY
      t.timestamps null: false
    end
  end
end
