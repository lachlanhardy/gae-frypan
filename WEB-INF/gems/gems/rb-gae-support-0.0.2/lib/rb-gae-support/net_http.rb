# We need to monkey patch after these.
require 'net/http'
require 'net/https'
require 'net/protocol'
require 'java'
require 'yaml'

module Net

  # Monkey Patching bundled Net::HTTP Library for java.new.URLConnection
  class HTTP < Protocol

    # Creates an instance. Ignores proxy config, not needed
    def self.new(address, port = nil, p_addr = nil, p_port = nil, p_user = nil, p_pass = nil)
      # ignore proxy - google don't need it.
      return newobj(address, port)
    end 

    # Contructor - saves address and port
    def initialize(address, port = nil)
      #raise 'got initialize'
      @address = address
      @port    = (port || HTTP.default_port)
    end

    # Actual request. Forms a URL, and uses a java.net.URLConnection to retrieve
    # the body, which it inserts into a Net::HTTPResponse object. Actual
    # network operation is completed here.
    def request(req, body = nil, &block)
      url = @use_ssl ? 'https://' : 'http://' + address + req.path
      jurl = java.net.URL.new(url)
      urlconn = jurl.openConnection()
      #puts "METHOD: #{req.method}"
      #puts "REQ: #{req.to_yaml}"
      
      req.each_header do |k,v|
        urlconn.addRequestProperty(k,v)
        #puts "#{k}; #{v}"
      end
      
      
      #p req.header
      urlconn.setRequestMethod(req.method)
      if req.method == 'POST' || req.method == 'PUT'
        urlconn.setDoOutput(true)
        urlconn.connect()
        if req.body
          out=urlconn.getOutputStream()
          
          out.write(req.body.to_java_bytes)
          out.close
        end
      end
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

    # We are always started
    def started?
      puts 'started called'
      true #always started.
    end

    # Avoids OpenSSL calls, sets the use SSL value which is checked when
    # generating the URL
    def use_ssl=(flag)
      flag = (flag ? true : false)
      @use_ssl = flag
    end

    # Override ssl context accessors
    # TODO - check what we can implement
    attr_accessor :ca_path, :verify_callback, :verify_depth, :cert_store, :ca_file, :key, :cert, :verify_mode
    
  end

  # Monkey Patching bundled Net::HTTPResponse Library for java.new.URLConnection
  class HTTPResponse
    # This is where the body is put by Net::HTTP#request
    attr_writer :body
    
    # Reads the response body. In our case the body has already been set in the
    # request.
    def read_body(dest = nil, &block)
      # TODO - handle block situation better, rather than one dump.
      if block
        yield @body
      else
        @body
      end
    end
    
  end
end


