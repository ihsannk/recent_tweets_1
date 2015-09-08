get '/' do
	erb :index
end

get '/recent_tweets' do
	# to display 10 recent tweets
	@twitter_user = TwitterUser.find_or_create_by(twitter_handle: params[:twitter_handle])
	  @recent_tweets = @twitter_user.fetch_tweets
	erb :recent_tweets
end
