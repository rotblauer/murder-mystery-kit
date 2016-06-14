class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.references :game, foreign_key: true
      t.string :name
      t.string :backstory
      t.string :attire

      t.timestamps
    end
  end
end
