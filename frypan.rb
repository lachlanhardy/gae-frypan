require 'rubygems'
require 'sinatra'
require File.dirname(__FILE__) + '/lib/openssl'
require File.dirname(__FILE__) + '/lib/net_http'
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
