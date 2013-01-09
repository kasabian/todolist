class AddPriorityToRecords < ActiveRecord::Migration
  def change
    add_column :records, :priority, :float
  end
end
