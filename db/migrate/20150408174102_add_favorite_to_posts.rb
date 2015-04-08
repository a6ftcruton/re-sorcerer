class AddFavoriteToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :favorite, :boolean, default: false
  end
end
