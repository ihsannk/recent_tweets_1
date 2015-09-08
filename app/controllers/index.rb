get '/' do
	# session.clear
	erb :index
end

get '/recent_tweets' do
	@user = TwitterUser.find_or_create_by(twitter_handle: params[:twitter_handle])
	@recent_tweets = @user.fetch_tweets
	# session[:user] = @user
	erb :recent_tweets
end

# get '/:username' do
# 	@user = TwitterUser.find_or_create_by(twitter_handle: params[:username])
# 	  @recent_tweets = @user.fetch_tweets
# 	erb :recent_tweets
# end

# get '/recent_tweets/:twitter_handle' do
# 	@user = User.find_by(twitter_handle: params[:twitter_handle])
# 	if @user.tweets_stale?
# 	@user.tweets.each {|tweet| tweet.destroy}
# 	@recent_tweets = @user.recent_tweets
# 	erb :user_tweets
#     else
# 	@recent_tweets = @user.tweets
# 	erb :user_tweets
#   end
# end

# def tweets_stale?
#   @user_tweets = self.tweets
#     if (Time.now - @user_tweets.first.created_at)/60 >= 15
#   	  return true
#     else
#   	  return false
#     end
#   end
