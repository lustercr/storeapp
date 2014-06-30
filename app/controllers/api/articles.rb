module API
  class Articles < Grape::API
    include API::BaseConfig

    resource :articles do

      desc 'Return a list of articles'
      get do
        articles = Article.all
        {success: true, articles: articles, total_elements: articles.size}
      end

      resource :stores do
        params do
          requires :id, type: Integer, desc: "Status id."
        end

        desc 'Returns a list of articles from the given store id'
        get ':id' do
          store = Store.find(params[:id])
          {success: true, articles: store.articles, total_elements: store.articles.size}
        end
      end
      
    end
  end
end