# We need to monkey patch after these.
require 'net/http'
require 'net/https'
require 'net/protocol'
require 'java'

module Net
  class HTTP < Protocol
    
    def self.new(address, port = nil, p_addr = nil, p_port = nil, p_user = nil, p_pass = nil)
      # ignore proxy - google don't need it.
      return newobj(address, port)
    end 
  
    def initialize(address, port = nil)
      #raise 'got initialize'
      @address = address
      @port    = (port || HTTP.default_port)
    end
    
    def request(req, body = nil, &block)
      url = @use_ssl ? 'https://' : 'http://' + address + req.path
      jurl = java.net.URL.new(url)
      urlconn = jurl.openConnection()
      inStream = java.io.InputStreamReader.new(urlconn.getInputStream())
      buff = java.io.BufferedReader.new(inStream)
      result = ''
      while line = buff.readLine() do
        result << line
      end
      
      resp = HTTPResponse.new("1.1", urlconn.getResponseCode(), urlconn.getResponseMessage())
      resp.body = result
      resp
    end
    
    def started?
      puts 'started called'
      true #always started.
    end
    
    def use_ssl=(flag)
      flag = (flag ? true : false)
      @use_ssl = flag
    end
    
    def verify_mode=(mode)
      # TODO - check the verify mode, and make sure
      # the URL fetcher uses it.
    end
    
  end
  
  class HTTPResponse
    attr_writer :body
    
    # TODO - handle block situation better, rather than one dump.
    def read_body(dest = nil, &block)
      if block
        yield @body
      else
        @body
      end
    end
    
  end
end


