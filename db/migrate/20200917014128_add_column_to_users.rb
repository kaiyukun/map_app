class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :userimage, :string
    add_column :users, :profile, :text
  end
end
