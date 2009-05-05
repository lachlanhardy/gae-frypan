# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rb-gae-support}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lincoln Stoll"]
  s.date = %q{2009-04-14}
  s.description = %q{Support utilities for ruby apps on Google App engine. Wraps GAE specific functionality, and modifies ruby standard libraries where needed (i.e Net:HTTP) to use GAE libraries}
  s.email = %q{lstoll@lstoll.net}
  s.files = ["README.rdoc", "TODO", "lib/rb-gae-support", "lib/rb-gae-support.rb", "lib/rb-gae-support/net_http.rb", "lib/rb-gae-support/memcache.rb", "lib/rb-gae-support/openssl.rb", "lib/rb-gae-support/user_service.rb", "lib/appengine-api-1.0-sdk-1.2.0.jar"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/lstoll/rb-gae-support}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8", "--main", "README.rdoc", "--title", "Ruby Goole AppEngine Support", "README.rdoc", "lib"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rb-gae-support}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{rb-gae-support is a support library for ruby apps on Google App Engine}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
