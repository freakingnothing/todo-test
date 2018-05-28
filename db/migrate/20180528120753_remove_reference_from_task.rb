class RemoveReferenceFromTask < ActiveRecord::Migration[5.2]
  def change
    remove_reference :tasks, :project, index: true
  end
end
