class CreateEvenings < ActiveRecord::Migration[5.0]
  def change
    create_table :evenings do |t|
      t.references :host, foreign_key: true
      t.references :game, foreign_key: true
      t.string :location
      t.string :caveat

      t.timestamps
    end
  end
end
