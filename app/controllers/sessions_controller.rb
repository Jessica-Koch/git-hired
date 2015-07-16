require 'uri'
require 'net/http'

class SessionsController < ApplicationController

  def create 
    render text: request.env['omniauth.auth'].to_yaml
    # @user = User.find_or_create_from_auth_hash(auth_hash)
    # self.current_user = @user
    # redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Signed out!'
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
# def create 
#   url = URI('https://angel.co/api/oauth/authorize?access_token=be59a26ca2c0b233891742051300f8c4365d2f42e4c58685&client_id=c273a4d8cac8229cee5052131e4f8d4affc52218bd481329&client_secret=a112c835871c836e767a4ea29b5b513301ac47fe60338540&response_type=code')

#   http = Net::HTTP.new(url.host, url.port)
#   http.use_ssl = true
#   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#   request = Net::HTTP::Get.new(url)

#   response = http.request(request)
#   puts response.read_body

# end

# def create
#   auth = request.env['omniauth.auth']
#   if User.find_by_uid(auth['uid'])
#     user = User.find_by_provider_and_uid(auth['provider'], auth['uid'])
#     session[:user_id] = user.id
#     user.update(token: env['omniauth.auth']['credentials']['token'])
#     redirect_to user_path(user), :notice => 'Signed in!'
#   else
#     user = User.create_with_omniauth(auth, params)
#     session[:user_id] = user.id
#     user.update(token: env['omniauth.auth']['credentials']['token'])
#     redirect_to first_splash_path(user), :notice => 'Signed in!'
#   end
# end


