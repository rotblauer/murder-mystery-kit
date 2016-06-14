class CreateEventCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :event_characters, id: false do |t|
      t.references :event, foreign_key: true
      t.references :character, foreign_key: true

      t.timestamps
    end
  end
end
