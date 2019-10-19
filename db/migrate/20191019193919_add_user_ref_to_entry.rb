class AddUserRefToEntry < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :user, foreign_key: true, index: true
  end
end
