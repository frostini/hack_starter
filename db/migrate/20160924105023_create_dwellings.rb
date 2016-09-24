class CreateDwellings < ActiveRecord::Migration
  def change
    create_table(:dwellings) do |t|
      t.references  :user, null: false
      t.string      :display_name
      t.integer     :monthly_rent
      t.integer     :num_rooms
      t.integer     :num_bathrooms
      t.string      :property_type
      t.boolean     :is_available
      t.string      :img_url


      t.timestamps null: false
    end

    add_index :dwellings, :user_id
  end
end
