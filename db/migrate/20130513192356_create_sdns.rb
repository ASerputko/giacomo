class CreateSdns < ActiveRecord::Migration
  def change
    create_table :sdns do |t|
      t.integer :uid
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
