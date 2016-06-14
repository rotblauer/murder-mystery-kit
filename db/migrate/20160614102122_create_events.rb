class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :game, foreign_key: true
      t.string :title
      t.integer :chronology

      t.timestamps
    end
  end
end
