class AddThumbnailToStores < ActiveRecord::Migration
  def change
    add_column :stores, :thumbnail, :string
  end
end
