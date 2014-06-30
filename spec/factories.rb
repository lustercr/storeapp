FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@gap.com"
  end

  sequence :login do |n|
    "login{n}"
  end

  sequence :unique_token do |n|
    "123ug67qefha#{n}hdasgda#{n}"
  end

  factory :user do
    email
    login
    password "helloworld"
    unique_token
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin_user, class: User do
    email
    login
    password "helloworld"
    admin      true
  end
end