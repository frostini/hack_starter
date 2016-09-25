class CreateFavorites < ActiveRecord::Migration
  def change
    create_table(:favorites) do |t|
      t.references   :dwelling
      t.integer      :participant_id

      t.timestamps null: false
    end

    add_index "favorites", ["dwelling_id", "participant_id"], :name => "index_on_favorites"

  end
end