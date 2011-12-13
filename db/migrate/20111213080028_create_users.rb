class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :provider
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
