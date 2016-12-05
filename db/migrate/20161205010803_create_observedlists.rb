class CreateObservedlists < ActiveRecord::Migration
  def change
    create_table :observedlists do |t|

      t.timestamps null: false
    end
  end
end
