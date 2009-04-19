require 'rubygems'
require 'sinatra'
if RUBY_PLATFORM == 'java'
  require 'rb-gae-support'
end
require 'twitter'
require 'haml'

# homepage
get '/' do
    @results = []
    @search = Twitter::Search.new('frypan')
    @search.per_page(100)
    @search.each do |item|
      @results << item["text"].gsub(/^@\w[a-z]+\s/, '')
    end
     
    haml :index, :options => {:format => :html5,
                             :attr_wrapper => '"'}
end


# oauth = Twitter::OAuth.new('consumer token', 'consumer secret')
oauth = Twitter::OAuth.new('GXuTs8jAPGaBAbb1S518Q', 'h9fD09H27tEgQtnqmj93YE1pqP9A1V9ZRKw21w')
# oauth.authorize_from_access('access token', 'access secret')
# 
# client = Twitter::Base.new(oauth)
# client.friends_timeline.each  { |tweet| puts tweet.inspect }
# client.user_timeline.each     { |tweet| puts tweet.inspect }
# client.replies.each           { |tweet| puts tweet.inspect }


consumer=oauth.consumer
t=consumer.get_request_token
puts t.authorize_url

