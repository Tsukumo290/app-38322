class CreateClosets < ActiveRecord::Migration[6.0]
  def change
    create_table :closets do |t|
      t.string     :brand,     null: false
      t.integer    :price,     null: false
      t.integer    :genre_id,  null: false
      t.integer    :color_id,  null: false
      t.integer    :season_id, null: false
      t.integer    :size_id,   null: false
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
