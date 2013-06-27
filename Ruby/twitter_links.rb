require 'json'

# try to load the oauth gem if missing install it
begin
  gem 'oauth'
rescue LoadError
  system('gem install oauth')
  Gem.clear_paths
end

require 'oauth'

# gets oauth token from twitter
def get_token
  consumer = OAuth::Consumer.new('jzICjLlLF3dLrGVaVal0w', '3ydl3o44K4MaR8sFAk2gWtTTzHfFc7PzZjelP0XIoik', {
      :site => 'https://api.twitter.com',
      :scheme => :header
  })
  token_hash = {
      :oauth_token => '14615533-Qy2ck9vrfqsNdUp5cGi5PpHyrqBRmh7aXP6qcUr9w',
      :oauth_token_secret => 'tECZ96ci1nXrvs3OkxSEbZyQtngQWslhgGeuTgEFJwU'
  }

  OAuth::AccessToken.from_hash(consumer, token_hash)
end

# query helper method
def query_twitter(access_token, tag)
  access_token.request(:get,
                       "https://api.twitter.com/1.1/search/tweets.json?q=%23#{tag}&count=100&result_type=recent")
end

# check to make sure we passed argument other wise exit with usage
unless ARGV.length == 1 and not ARGV[0].empty?
  p 'Usage:twitter_links.rb hashtag'
 exit
end

# remove # if it was passed
tag = ARGV[0]
tag = tag[1..-1] if tag.start_with?('#')

p 'Retrieving tweets for tag #' + tag

access_token = get_token
response = query_twitter  access_token, tag

# make sure we got a good response otherwise print out the error
if response.code != '200'
  print 'Error querying twitter'
  print response.body
  exit
end

# parse the result
tweets = JSON.parse(response.body)
list_id = 1
# find the tweets with links int hem
tweets['statuses'].each do |tweet|
  if (m = tweet['text'].match(/http:\/\/.*?\s/))
    p "#{list_id.to_s}. #{m[0].strip}"
    list_id += 1
  end
end



