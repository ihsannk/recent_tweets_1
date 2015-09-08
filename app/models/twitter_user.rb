class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets
  	@user_timeline = $twitter.user_timeline(self.twitter_handle)
  	@recent_tweets = @user_timeline.take(10)
  	@recent_tweets.each do |t|
  		Tweet.find_or_create_by(tweet_id: self.id, text: t.text)
  	end
  end

  def stale
    
  end
end
