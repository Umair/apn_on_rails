require 'rubygems'
require 'rspec'
require 'action_view'

Dir.glob(File.join(File.dirname(__FILE__), 'extensions', '*.rb')).sort.each do |f|
  require f
end

require File.join(File.dirname(__FILE__), 'active_record', 'setup_ar.rb')

require File.join(File.dirname(__FILE__), '..', 'lib', 'apn_on_rails')

# Dir.glob(File.join(File.dirname(__FILE__), 'factories', '*.rb')).sort.each do |f|
#   require f
# end

require File.join(File.dirname(__FILE__), 'factories', 'app_factory.rb')
require File.join(File.dirname(__FILE__), 'factories', 'device_factory.rb')
require File.join(File.dirname(__FILE__), 'factories', 'group_factory.rb')
require File.join(File.dirname(__FILE__), 'factories', 'device_grouping_factory.rb')
require File.join(File.dirname(__FILE__), 'factories', 'group_notification_factory.rb')
require File.join(File.dirname(__FILE__), 'factories', 'notification_factory.rb')
require File.join(File.dirname(__FILE__), 'factories', 'pull_notification_factory.rb')

configatron.apn.cert = File.expand_path(File.join(File.dirname(__FILE__), 'rails_root', 'config', 'apple_push_notification_development.pem'))

RSpec.configure do |config|
  
  config.before(:all) do
    
  end
  
  config.after(:all) do
    
  end
  
  config.before(:each) do

  end
  
  config.after(:each) do
    
  end
  
end

def fixture_path(*name)
  return File.join(File.dirname(__FILE__), 'fixtures', *name)
end

def fixture_value(*name)
  return File.read(fixture_path(*name))
end

def write_fixture(name, value)
  File.open(fixture_path(*name), 'w') {|f| f.write(value)}
end

def apn_cert
  File.read(File.join(File.dirname(__FILE__), 'rails_root', 'config', 'apple_push_notification_development.pem'))
end

class BlockRan < StandardError
end