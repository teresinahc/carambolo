class AddUserReferencesToEntries < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :user, null: false, foreign_key: true
  end
end
