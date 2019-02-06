class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :title
      t.text :content
      t.string :image_url                                                                                                                                                                 
      t.datetime :created_at
      t.datetime :updated_at
      t.references :user
    end
  end
end
