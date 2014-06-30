# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text
#  price          :float
#  total_in_shelf :integer
#  total_in_vault :float
#  store_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Article < ActiveRecord::Base
  has_paper_trail
  belongs_to(:store)
  mount_uploader :thumbnail, ArticleImageUploader
  validates :name, :sku, :description, :price, :total_in_shelf, :total_in_vault, :store_id, presence: true
  validates_uniqueness_of(:sku)
end
