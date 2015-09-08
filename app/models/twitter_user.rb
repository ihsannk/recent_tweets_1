class TwitterUser < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets
  	@user_tweets = $twitter.user_timeline(self.twitter_handle)
  	@ten_tweets = @user_tweets.take(10)
  	@ten_tweets.each do |tweet|
  	Tweet.find_or_create_by(tweet_id: self.id, text: tweet.text)
  	end
  end

  def stale?
    @last_post_at = self.tweets.last.created_at
    time_difference = Time.now - @last_post_at
    if time_difference > 900
      true
    else
      false
    end
  end

end
