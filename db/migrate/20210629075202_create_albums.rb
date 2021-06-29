class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :year
      t.string :album_type
      t.integer :band_id
      t.references :band, foreign_key: true

      t.timestamps
    end
  end
end
