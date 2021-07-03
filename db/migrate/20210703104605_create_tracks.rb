class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.string :track_type, null: false, default: "REGULAR"
      t.references :album, foreign_key: true
      t.references :band, foreign_key: true

      t.timestamps
    end
  end
end
