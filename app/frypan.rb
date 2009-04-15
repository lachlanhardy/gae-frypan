require 'rubygems'
require 'sinatra'
require 'rb-gae-support'
require 'twitter'
require 'haml'

# homepage
get '/' do
    if @results = GAE::Memcache['twitter-search-frypan-results']
    else
      @results = []
      @search = Twitter::Search.new('frypan')
      @search.per_page(100)
      @search.each do |item|
        @results << item["text"].gsub(/^@\w[a-z]+\s/, '')
      end
      # Note - Items need to be Java Serializable. Strings and simple types work, 
      # But stuff like arrays need to be converted to java.
      GAE::Memcache.put('twitter-search-frypan-results', @results.to_java(:String), 120000)
    end
     
    haml :index, :options => {:format => :html5,
                             :attr_wrapper => '"'}
end
