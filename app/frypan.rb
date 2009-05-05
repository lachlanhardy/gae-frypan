require 'rubygems'
require 'sinatra'
if RUBY_PLATFORM == 'java'
  require 'rb-gae-support'
end
require 'twitter'
require 'haml'
require 'pp'

configure do
  set :sessions, true
end

# homepage
get '/' do
    
    # require File.join(File.dirname(__FILE__), '..', 'lib', 'twitter')
    require File.join(File.dirname(__FILE__), 'helpers', 'config_store')
    
    config = ConfigStore.new(File.join(File.dirname(__FILE__), '..', "config", ".twitter"))
    
    oauth = Twitter::OAuth.new(config['token'], config['secret'])
    
    if config['atoken'] && config['asecret']
      oauth.authorize_from_access(config['atoken'], config['asecret'])
      twitter = Twitter::Base.new(oauth)
      pp twitter.friends_timeline

    elsif config['rtoken'] && config['rsecret']  
      oauth.authorize_from_request(config['rtoken'], config['rsecret'])
      twitter = Twitter::Base.new(oauth)
      pp twitter.friends_timeline

      config.update({
        'atoken'  => oauth.access_token.token,
        'asecret' => oauth.access_token.secret,
      }).delete('rtoken', 'rsecret')
    else
      config.update({
        'rtoken'  => oauth.request_token.token,
        'rsecret' => oauth.request_token.secret,
      })

      @auth_link = oauth.request_token.authorize_url
      
    end
    
    # @results = []
    #     @search = Twitter::Search.new('frypan')
    #     @search.per_page(100)
    #     @search.each do |item|
    #       @results << item["text"].gsub(/^@\w[a-z]+\s/, '')
    #     end
    
    
    haml :index, :options => {:format => :html5,
                             :attr_wrapper => '"'}
end

get '/auth' do
  # ?oauth_token=I084k3L84UU3xoHncars9gQS9mzl95X9FUE49C6ww&user_id=10706&screen_name=lachlanhardy
  
  
end

