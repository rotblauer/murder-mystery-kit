class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.references :evening, foreign_key: true
      t.string :name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
