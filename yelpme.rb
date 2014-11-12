require 'yelp'
require 'twitter'
require 'tweetstream'
require 'pry'


TweetStream.configure do |config|
  config.consumer_key       = '36SaOjI1ZKUMKGHDTys3X4bBN'
  config.consumer_secret    = 'nxAqMVpZugnTzqwJ3osLi1kLYzqR05fdrg2N3IH8aViRFX6AuH'
  config.oauth_token        = '2784533140-FuPhUmnBwzcS7yHzfO88unPabT2OCjB2UdfZ4x4'
  config.oauth_token_secret = 'eFVWBZmvSnmCdRSMHiTCEboApsglLGU53IlGOc3g1pkOP'
  config.auth_method        = :oauth
end

def yelp_top_three
  client = Yelp::Client.new({ consumer_key: "OX6qYqj3k-j5DqYrh68-hw",
                               consumer_secret: "pzC9Kq3lKz16aIqxx2SKC89L8Ns",
                               token: "hMjLFoM2t4DNczbtqrHPHUi3qtMWWZVb",
                               token_secret: "HaG8vI4y1uTkWbHQ0S6L_GfBm7s"
                            })
  params = { term: 'restaurants',
             sort: 3,
             limit: 3
           }
  results = client.search("Portland", params)
  return "You are Yelped. 1. #{results.businesses[0].name}, 2. #{results.businesses[1].name}, 3. #{results.businesses[2].name}"
end

def twitter_returns

  @yelpme = Twitter::REST::Client.new do |config|
    config.consumer_key        = '36SaOjI1ZKUMKGHDTys3X4bBN'
    config.consumer_secret     = 'nxAqMVpZugnTzqwJ3osLi1kLYzqR05fdrg2N3IH8aViRFX6AuH'
    config.access_token        = '2784533140-FuPhUmnBwzcS7yHzfO88unPabT2OCjB2UdfZ4x4'
    config.access_token_secret = 'eFVWBZmvSnmCdRSMHiTCEboApsglLGU53IlGOc3g1pkOP'
  end

  request = TweetStream::Client.new

  request.track('@YelpMeNow') do |status|
    #print out the tweet
    puts "@" + status.user.screen_name + " - " + status.text

    #reply to the tweet
    message = @yelpme.update("@#{status.user.screen_name}, I can yelp you!")
    puts message
    puts Time.now
    # binding.pry
  end
end

# puts yelp_top_three
# def parse_tweet(hash)
# #parse tweets for (1) geo location, (2) zipcode, (3) "help", (4)handle
# end
# def send_tweet
# end
#     # case
#     # when status.geo?
#     #   #send information back via
#     # else
#     #   puts "No location found. Can't yelp you! Turn on your GPS. :( "
#     # end
# client.update("I'm tweeting with @gem!")

#can't hashtag numbers

twitter_returns
