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
    
  validates_uniqueness_of :email, :login, :unique_token
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :login

  before_create :encrypt_password, :create_unique_token

  def self.authenticate(login, password)
    user = User.where("email = ? or login = ?", login, login).take
    if user && user.password == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end 
  end

  def self.authenticate_by_unique_token(token, login)
    User.where('unique_token = ? and login = ?', token, login).take
  end
  
  private
    def encrypt_password
        self.password_salt = BCrypt::Engine.generate_salt
        self.password = BCrypt::Engine.hash_secret(password, password_salt)
    end

    def create_unique_token
      self.unique_token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless User.exists?(unique_token: random_token)
      end
    end

end
