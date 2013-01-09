class RemovePriorityFromRecords < ActiveRecord::Migration
  def up
    remove_column :records, :priority
  end

  def down
    add_column :records, :priority, :integer
  end
end
