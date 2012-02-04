class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :username
      t.string :imageurl
      t.string :user_id
      t.string :follower_id

      t.timestamps
    end
    add_index :followers, :follower_id, :unique => true
  end
end
