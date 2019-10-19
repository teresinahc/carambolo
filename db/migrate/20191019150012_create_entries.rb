class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :feeling
      t.text :description

      t.timestamps
    end
  end
end
