# This is a wrapper around the google provided services on appengine.
# It is intended to make the services more 'ruby' like
#
# Author::    Lincoln Stoll  (mailto:lstoll@lstoll.net)
# Copyright:: Copyright (c) 2009 Lincoln Stoll
# License::   MIT

require 'java'
require File.dirname(__FILE__) + '/appengine-api-1.0-sdk-1.2.0.jar'
directory = File.dirname(__FILE__)
$:.unshift(directory) unless $:.include?(directory)

require 'rb-gae-support/openssl'
require 'rb-gae-support/user_service'
require 'rb-gae-support/net_http'
require 'rb-gae-support/memcache'
