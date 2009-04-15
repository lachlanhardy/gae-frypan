require 'java'

module GAE
  # Wraps the google app engine memcache service. Can be used like a big hash
  class Memcache

    # Retrieves an object from the Memcache store by it's key
    def self.[](key)
      get_svc.get(key)
    end

    # Sets an object into memcache.
    def self.[]=(key,value)
      put(key, value)
    end

    # Adds an object to the store, otionally setting it's expiry X milliseconds in the future.
    def self.put(key, value, expire_millis=nil)
      if expire_millis
        exp = com.google.appengine.api.memcache.Expiration.byDeltaMillis(expire_millis)
        get_svc.put(key, value, exp)
      else
        get_svc.put(key, value)
      end
    end

    # Deletes the object from the store
    def self.delete(key)
      get_svc.delete(key)
    end

    private
    def self.get_svc
      com.google.appengine.api.memcache.MemcacheServiceFactory.getMemcacheService()
    end

  end
end
