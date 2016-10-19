class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password
      #t.string :level #Well, our requirement is that our user can login as a guest.
      t.string :e_mails
      t.integer :zip_code 
      t.timestamps null: false
    end
  end
end
