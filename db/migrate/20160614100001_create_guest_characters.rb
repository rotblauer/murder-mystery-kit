class CreateGuestCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :guest_characters, id: false do |t|
      t.references :guest, foreign_key: true
      t.references :character, foreign_key: true
      t.references :evening, foreign_key: true

      t.timestamps
    end
  end
end
