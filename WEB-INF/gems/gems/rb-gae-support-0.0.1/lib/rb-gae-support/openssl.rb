# This module mocks out OpenSSL functionality to stop net/http erroring.
module OpenSSL
  # Providing a dummy SSL module
  module SSL
    # Dummy value to prevent errors with Net::HTTP
    VERIFY_NONE = nil
    # Dummy value to prevent errors with Net::HTTP
    VERIFY_PEER = nil
  end
end