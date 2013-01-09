class AddListIdToRecord < ActiveRecord::Migration
  def change
    add_column :records, :list_id, :integer
  end
end
