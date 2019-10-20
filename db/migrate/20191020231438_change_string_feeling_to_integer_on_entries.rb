class ChangeStringFeelingToIntegerOnEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :feeling
    add_column :entries, :feeling, :integer
  end
end
