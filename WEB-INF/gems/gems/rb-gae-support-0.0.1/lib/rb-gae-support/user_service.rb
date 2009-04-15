module GAE
  # This class represents the User service. It can be used to detemine if
  # a user is logged in, if they are an admin, and retrieve their email,
  # nickname and auth domain. It also provides the login and logout URLs.
  class User
    import com.google.appengine.api.users.UserServiceFactory
  
    attr_reader :email, :nickname, :auth_domain
  
    # Returns the current logged in user object, or false if not logged in
    def self.current
      # load from GAE and return, set vars
      if UserServiceFactory.user_service.user_logged_in?
        gu = UserServiceFactory.user_service.get_current_user
        return User.new(gu.getEmail, gu.getNickname, gu.getAuthDomain)
      else
        return false
      end
    end
  
    # Returns the URL for the login form. Pass in the relative URL you
    # wish to return to when the login is complete
    def self.login_url(return_to)
      UserServiceFactory.user_service.create_login_url(return_to)
    end
  
    # Returns the URL to log out the user. Pass in the relative URL you
    # wish to return to when the logout is complete
    def self.logout_url(return_to)
      UserServiceFactory.user_service.create_logout_url(return_to)
    end
  
    # Returns true if the user is logged in, false if not
    def self.logged_in?
      UserServiceFactory.user_service.user_logged_in?
    end
  
    # Returns true if the user is marked as an admin, false if not.
    def self.admin?
      UserServiceFactory.user_service.user_logged_in? && UserServiceFactory.user_service.user_admin?
    end

    private
    def initialize(email,nickname,auth_domain)
      @email, @nickname, @auth_domain = email, nickname, auth_domain
    end

  end
end