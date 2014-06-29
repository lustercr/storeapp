json.array!(@users) do |user|
  json.extract! user, :id, :login, :email, :password, :password_salt, :has_device_access, :unique_token, :admin
  json.url user_url(user, format: :json)
end
