class Change < ActiveRecord::Migration[6.0]
  def change
    change_column :visits, :date, :date, using: 'date::date'
  end
end
