class CreateDwellings < ActiveRecord::Migration
  def change
    create_table(:dwellings) do |t|
      t.integer     :host_id, null: false
      t.integer     :participant_id
      t.string      :display_name, null: false
      t.integer     :monthly_rent, null: false
      t.integer     :num_rooms, null: false
      t.integer     :num_bathrooms, null: false
      t.string      :property_type, null: false
      t.boolean     :is_available, null: false, default: true
      t.string      :img_url


      t.timestamps null: false
    end

    add_index :dwellings, [:host_id, :participant_id]
  end
end
