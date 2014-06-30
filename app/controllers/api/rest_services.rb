module API
  class RESTServices < Grape::API
    mount API::Articles
    mount API::Stores
  end
end