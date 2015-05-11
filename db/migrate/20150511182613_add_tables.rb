class AddTables < ActiveRecord::Migration
  def change

    create_table(:divisions) do |t|
      t.column(:department, :string)

      t.timestamps()
    end
    create_table(:employees) do |t|
      t.column(:name, :string)
      t.column(:division_id, :integer)

      t.timestamps
    end
    
  end
end
