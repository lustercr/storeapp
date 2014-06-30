# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :text
#  created_at :datetime
#  updated_at :datetime
#

class Store < ActiveRecord::Base
  has_paper_trail
  has_many(:articles)
  mount_uploader :thumbnail, ArticleImageUploader
  validates :name, :address, presence: true
end
