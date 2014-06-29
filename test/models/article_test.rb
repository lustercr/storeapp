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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
