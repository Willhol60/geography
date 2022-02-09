class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :trip_count, :integer, null: false, default: 0
  end
end
