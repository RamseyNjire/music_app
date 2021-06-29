class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :year, null: false
      t.string :album_type, default: "STUDIO", null: false
      t.integer :band_id, bull: false
      t.references :band, foreign_key: true

      t.timestamps
    end
  end
end
