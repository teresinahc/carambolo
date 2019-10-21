class AddDayToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :day, :date
  end
end
