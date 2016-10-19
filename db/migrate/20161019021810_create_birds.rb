class CreateBirds < ActiveRecord::Migration
  def change
    create_table :birds do |t|
      t.string :name #Bird's name#
      t.float :locationX #As its name, it means location.
      t.float :locationY #愚蠢的选择，居然没有数对。H.K.
      t.string :wiki_link #Links from wikipedia.
      t.datetime :last_seen #The date with birds are seen last time. As I remember, it is Y/M/D, maybe improved later.
      t.integer :frequency #How many times we seen this kind of bird.
      t.timestamps null: false
    end
  end
end
