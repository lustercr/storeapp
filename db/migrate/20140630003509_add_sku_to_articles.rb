class AddSkuToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :sku, :integer
  end
end
