class CreateDwellingApplications < ActiveRecord::Migration
  def change
    create_table(:dwelling_applications) do |t|
      t.integer     :dwelling_id, null: false
      t.integer     :applicant_id, null: false
      t.integer     :program_id, null: false
      t.text        :message
      t.boolean     :is_approved


      t.timestamps null: false
    end

    add_index :dwelling_applications, [:applicant_id, :dwelling_id]
  end
end
