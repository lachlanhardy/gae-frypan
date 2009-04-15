root_dir = File.join(File.dirname(__FILE__))
require 'rexml/document'
include REXML

desc "Updates the rackup in web.xml"
task :update_rackup do
  # Load the new rackup
  rackup = ''
  f = File.open(root_dir + '/config/rackup.ru', "r") 
  f.each_line do |line|
    rackup += line
  end
  
  File.open(root_dir + '/WEB-INF/web.xml') do |config_file|
    # Open the document and edit the rackup
    config = Document.new(config_file)
    config.root.elements.each('context-param') do |e|
      if e.elements['param-name'].text == 'rackup'
        e.elements['param-value'].text = rackup
      end
    end

    # Write the result to a new file.
    formatter = REXML::Formatters::Default.new
    File.open(root_dir + '/WEB-INF/web.xml', 'w') do |result|
      formatter.write(config, result)
    end
  end
  puts 'web.xml updated'
end

desc "Updates and freezes required gems"
task :update_gems do
  gems = YAML::load(File.open(root_dir + '/config/config.yml'))['gems'].join(' ')
  gems_path = root_dir + '/WEB-INF/gems'
  if gems == ""
    puts 'No gems to install.'
  else
    puts 'Installing gems.. please wait'
    `gem install --no-ri --no-rdoc -i #{gems_path} #{gems}` if gems
    puts 'Gems installed'
  end
end