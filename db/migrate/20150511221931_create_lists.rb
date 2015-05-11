class CreateLists < ActiveRecord::Migration
  def change
    create_table(:lists) do |l|
      l.column(:name, :string)

      l.timestamps()
    end
  end
end
