# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{twitter}
  s.version = "0.6.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Nunemaker"]
  s.date = %q{2009-04-14}
  s.email = %q{nunemaker@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["History", "License", "Notes", "README.rdoc", "Rakefile", "VERSION.yml", "examples/connect.rb", "examples/friendship_existance.rb", "examples/helpers/config_store.rb", "examples/httpauth.rb", "examples/search.rb", "examples/timeline.rb", "examples/update.rb", "examples/user.rb", "lib/twitter.rb", "lib/twitter/base.rb", "lib/twitter/httpauth.rb", "lib/twitter/oauth.rb", "lib/twitter/request.rb", "lib/twitter/search.rb", "test/fixtures/firehose.json", "test/fixtures/friends_timeline.json", "test/fixtures/rate_limit_exceeded.json", "test/fixtures/replies.json", "test/fixtures/search.json", "test/fixtures/search_from_jnunemaker.json", "test/fixtures/status.json", "test/fixtures/user.json", "test/fixtures/user_timeline.json", "test/test_helper.rb", "test/twitter/base_test.rb", "test/twitter/httpauth_test.rb", "test/twitter/oauth_test.rb", "test/twitter/request_test.rb", "test/twitter/search_test.rb", "test/twitter_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jnunemaker/twitter}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{twitter}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{wrapper for the twitter api (oauth only)}
  s.test_files = ["test/test_helper.rb", "test/twitter/base_test.rb", "test/twitter/httpauth_test.rb", "test/twitter/oauth_test.rb", "test/twitter/request_test.rb", "test/twitter/search_test.rb", "test/twitter_test.rb", "examples/connect.rb", "examples/friendship_existance.rb", "examples/helpers/config_store.rb", "examples/httpauth.rb", "examples/search.rb", "examples/timeline.rb", "examples/update.rb", "examples/user.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>, ["= 0.3.2"])
      s.add_runtime_dependency(%q<mash>, ["= 0.0.3"])
      s.add_runtime_dependency(%q<httparty>, ["= 0.4.2"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<jeremymcanally-matchy>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<mash>, [">= 0"])
    else
      s.add_dependency(%q<oauth>, ["= 0.3.2"])
      s.add_dependency(%q<mash>, ["= 0.0.3"])
      s.add_dependency(%q<httparty>, ["= 0.4.2"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<jeremymcanally-matchy>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<mash>, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth>, ["= 0.3.2"])
    s.add_dependency(%q<mash>, ["= 0.0.3"])
    s.add_dependency(%q<httparty>, ["= 0.4.2"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<jeremymcanally-matchy>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<mash>, [">= 0"])
  end
end
