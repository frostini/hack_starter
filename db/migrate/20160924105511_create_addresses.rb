class CreateAddresses < ActiveRecord::Migration
  def change
    create_table(:addresses) do |t|
      t.string    :addressable_id, null: false
      t.string    :addressable_type, null: false
      t.string    :phone
      t.string    :line_1
      t.string    :line_2
      t.string    :city
      t.string    :state
      t.string    :zipcode
      t.decimal   :lat
      t.decimal   :lng

      t.timestamps null: false
    end

    add_index "addresses", ["addressable_type", "addressable_id"], :name => "index_addresses_on_addressable"
    add_index "addresses", ["lat", "lng"], :name => "index_address_on_lat_lng"
    add_index "addresses", "zipcode", :name => "index_on_addresses_zipcode"
  end
end
