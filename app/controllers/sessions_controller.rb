#coding: utf-8
class SessionsController < ApplicationController
     @@tweets = nil
def create
    auth = request.env["omniauth.auth"]


     client = Twitter::REST::Client.new do |config|
     config.consumer_key = '0Kb5FSrZO8f3d8a5E99csH3zS'
     config.consumer_secret = '6Lr9hLeQPRv1eUJP35xtwLQpjiwTvsO8UCJ8s8NKVypKkdlQxA'
     config.oauth_token = '2765751696-KcpwcN6U0fL6RqktzdliULiofwZhb8476Hf3LsK'
     config.oauth_token_secret = '5vl8ZETGrwh7GNvrIJ5QeDNz48hWmSq15lJHC6xMml5dY'
        end

        @tweets = []
 client.home_timeline(include_entities: true).each do |tw|
   @tweets << tw
 end
 @@tweets = @tweets

    redirect_to "/sessions/preview", :notice => 'sign in'
  end


  def index
     auth = request.env["omniauth.auth"]


     client = Twitter::REST::Client.new do |config|
     config.consumer_key = '0Kb5FSrZO8f3d8a5E99csH3zS'
     config.consumer_secret = '6Lr9hLeQPRv1eUJP35xtwLQpjiwTvsO8UCJ8s8NKVypKkdlQxA'
     config.oauth_token = '2765751696-KcpwcN6U0fL6RqktzdliULiofwZhb8476Hf3LsK'
     config.oauth_token_secret = '5vl8ZETGrwh7GNvrIJ5QeDNz48hWmSq15lJHC6xMml5dY'
        end


@para = params[:para]
#search = Twitter::REST::Search.new

        @tweets = []
 #search.containing(@para).language("ja").result_type("recent").per_page(5).each do |tw|
 client.search(@para, :result_type => "recent").take(10).collect do |tw|
   @tweets << tw
 end
  end

  def preview
@tweets = @@tweets
auth = request.env["omniauth.auth"]


     client = Twitter::REST::Client.new do |config|
     config.consumer_key = '0Kb5FSrZO8f3d8a5E99csH3zS'
     config.consumer_secret = '6Lr9hLeQPRv1eUJP35xtwLQpjiwTvsO8UCJ8s8NKVypKkdlQxA'
     config.oauth_token = '2765751696-KcpwcN6U0fL6RqktzdliULiofwZhb8476Hf3LsK'
     config.oauth_token_secret = '5vl8ZETGrwh7GNvrIJ5QeDNz48hWmSq15lJHC6xMml5dY'
        end

        @tweets = []
 client.trends(23424856).each do |tw|
   @tweets << tw
 end

  end
end