class AddHourToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :hour, :time
  end
end
