class CreateDwellingsPrograms < ActiveRecord::Migration
  def change
    create_table(:dwellings_programs) do |t|
      t.references   :dwelling
      t.references   :program

      t.timestamps null: false
    end

    add_index "dwellings_programs", ["dwelling_id", "program_id"], :name => "index_on_dwellings_programs"

  end
end
