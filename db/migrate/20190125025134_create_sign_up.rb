class CreateSignUp < ActiveRecord::Migration[5.2]
  def change
    create_table :user_signup do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :date_of_birth
      t.references :user
    end
  end
end
