Frypan
======

Makin' your bac'n hot!


What is it?
-----------

That's difficult to say yet as it's simply a twinkle in a few parental eyes right now, but it's safe to say it'd be nothing at all without a precisely detailed, and very quick off the mark, [article by Samuel Goebert](http://blog.bigcurl.de/2009/04/running-sinatra-apps-on-google.html).

See Lincoln Stoll's [rb-gae-support gem](http://github.com/lstoll/rb-gae-support) for continued awesomeness.


Some commands
-------------
- To start the dev appserver, just runt 'dev_appserver.sh .' from the application root directory
- to add gems, add them to config/config.yml , then run rake update_gems
- the rackup file is in config/rackup.ru . if you change it, run rake update_rackup
- all application files live under /app now - you'll see the frypan.rb and views there.