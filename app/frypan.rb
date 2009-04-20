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
consumer = oauth.consumer
t = consumer.get_request_token

puts t.authorize_url
