class CreateSignups < ActiveRecord::Migration[5.2]
  def change
    create_table :signups do |t|
      t.string :username
      t.string :password
      t.string :firstname
      t.string :lastname	
      t.string :email	
      t.string :dob
    end

  end
end
