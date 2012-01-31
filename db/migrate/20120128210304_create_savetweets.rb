class CreateSavetweets < ActiveRecord::Migration
  def change
    create_table :savetweets do |t|
      t.string :username
      t.string :userimageurl
      t.string :usertext
      t.integer :post_id

      t.timestamps
    end
    add_index :savetweets, :post_id, :unique => true
  end
end
