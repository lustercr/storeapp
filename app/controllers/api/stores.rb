module API
  class Stores < Grape::API
    include API::BaseConfig

    resource :stores do
      desc 'Return a list of stores'
      get do
        stores = Store.all
        {success: true, stores: stores, total_elements: stores.size}
      end
    end
  end
end