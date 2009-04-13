# This module mocks out OpenSSL functionality to stop net/http erroring.
module OpenSSL
  module SSL
    VERIFY_NONE = nil
    VERIFY_PEER = nil
  end
end