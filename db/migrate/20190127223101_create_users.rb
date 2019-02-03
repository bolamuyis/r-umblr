class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name	
      t.string :email	
      t.string :dob
      t.string :username
      t.string :password
      t.integer :post_counter

      # the following is the same as t.timestamps
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
