class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  before_filter :authenticate
  after_filter :cors_set_access_control_headers
  skip_before_filter :authenticate, :only => [:route_options]

  def route_options
      cors_preflight_check
  end

  private

  def authenticate
      authenticate_or_request_with_http_basic do |email, password|
          user = User.where(email:email)[0]
          if user
              @current_user = user.authenticate(password)
          end
      end
  end

  def cors_set_access_control_headers
      response.headers['Access-Control-Allow-Origin'] = '*'
      response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
      response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email'
      response.headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
      if request.method == 'OPTIONS'
          request.headers['Access-Control-Allow-Origin'] = '*'
          request.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
          request.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token, Auth-Token, Email'
          request.headers['Access-Control-Max-Age'] = '1728000'
          render :text => '', :content_type => 'text/plain'
      end
  end
end
