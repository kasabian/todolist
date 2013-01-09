class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :title
      t.boolean :check
      t.integer :priority

      t.timestamps
    end
  end
end
