class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :url
      t.text :embed_code
      t.references :recipe, foreign_key: true

      t.timestamps
    end
  end
end
