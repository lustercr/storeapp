module API
  module BaseConfig

    # if you're using Grape outside of Rails, you'll have to use Module#included hook
    extend ActiveSupport::Concern

    included do
      format :json

      before do
        error!({ success: false, error_code: 401, error_msg: 'Unauthorized' }, 401) unless current_user
      end

      helpers do
        def current_user
          unique_token = headers['X-Auth-Token'] || params[:user_token]
          login = params[:user_login]
          @current_user ||= User.authenticate_by_unique_token(unique_token, login) if unique_token
        end
      end

      http_basic do |username, password| 
        { Rails.configuration.api.http_basic_user => Rails.configuration.api.http_basic_password }[username] == password
      end

      # global handler for params validation errors
      rescue_from Grape::Exceptions::ValidationErrors do |e|
        Rack::Response.new({
          success: false,
          error_code: 400,
          error_msg: Rails.configuration.api.bad_request
        }.to_json, 400)
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        Rack::Response.new({
          success: false,
          error_code: 404,
          error_msg: Rails.configuration.api.record_not_found
        }.to_json, 404).finish
      end

      rescue_from :all do |e|
        Rack::Response.new({
          success: false,
          error_code: 500,
          error_msg: e.message
        }.to_json, 500).finish
      end
    end
  end
end