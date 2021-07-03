class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.text :title
      t.integer :ord
      t.text :lyrics
      t.references :album, foreign_key: true
      t.references :band, foreign_key: true

      t.timestamps
    end
  end
end
