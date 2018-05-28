class AddTaskableIdAndTaskableTypeToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :taskable_id, :integer
    add_column :tasks, :taskable_type, :string
  end
end
