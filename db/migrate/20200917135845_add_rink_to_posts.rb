class AddRinkToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :rink, :string
  end
end
