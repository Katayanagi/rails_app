class SessionsController < ApplicationController
	def create
    auth = request.env["omniauth.auth"]


     client = Twitter::REST::Client.new do |config|
     config.consumer_key = '0Kb5FSrZO8f3d8a5E99csH3zS'
     config.consumer_secret = '6Lr9hLeQPRv1eUJP35xtwLQpjiwTvsO8UCJ8s8NKVypKkdlQxA'
     config.oauth_token = auth['credentials']['token']
     config.oauth_token_secret = auth['credentials']['secret']
        end

    redirect_to "https://twitter.com/?lang=ja", :notice => 'sign in'
  end
  def index
  end

  def preview
  end
end
