class RenameUserimageColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :userimage, :image
  end
end
