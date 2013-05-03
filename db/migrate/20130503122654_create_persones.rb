class CreatePersones < ActiveRecord::Migration
  def change
    create_table :persones do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :status
      t.string :email

      t.timestamps
    end
  end
end
