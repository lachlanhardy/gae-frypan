require 'java'

# This module mocks out OpenSSL functionality to stop net/http erroring, and adds support
# for some basic openssl functionality
module OpenSSL
  # Providing a dummy SSL module
  module SSL
    # Dummy value to prevent errors with Net::HTTP
    VERIFY_NONE = nil
    # Dummy value to prevent errors with Net::HTTP
    VERIFY_PEER = nil
  end
  
  # Returns a string with a size number of secure random bytes
  class Random
    def self.random_bytes(size)
      # TODO - bounds check input, see how openssl does it.
      random = java.security.SecureRandom.new
      bytes = Java::byte[size].new
      random.nextBytes(bytes)
      String.from_java_bytes(bytes)
    end
  end
  
end