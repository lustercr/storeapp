# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  login             :string(255)
#  email             :string(255)
#  password          :string(255)
#  password_salt     :string(255)
#  has_device_access :boolean
#  unique_token      :string(255)
#  admin             :boolean
#  created_at        :datetime
#  updated_at        :datetime
#

class User < ActiveRecord::Base
  has_paper_trail
end
