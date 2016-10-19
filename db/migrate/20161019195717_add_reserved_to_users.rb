class AddReservedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reserved, :boolean
  end
end
