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
    
  validates_uniqueness_of :email, :login
  before_save :encrypt_password


  def self.authenticate(login, password)
    user = User.where("email = ? or login = ?", login, login).take
    if user && user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end end
  
  def encrypt_password
      self.password_salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, password_salt)
  end

end
