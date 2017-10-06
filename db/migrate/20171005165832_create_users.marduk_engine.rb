# This migration comes from marduk_engine (originally 20170606125505)
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :birthday
      t.string :gender

      t.timestamps
    end
  end
end
