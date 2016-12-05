class Observedlist < ActiveRecord::Migration
  def change
    create_table :observedlists do |t|
      t.belongs_to :user
      t.timestamps null: false
    end
    create_table :birds_observedlists, id: false do |t|
      t.belongs_to :observedlist, index: true
      t.belongs_to :bird, index: true
    end
  end
end
