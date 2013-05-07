require "rspec"
require "active_record"
require "factory_girl"

Dir["#{File.dirname(__FILE__)}/../model/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/factories/**/*.rb"].each {|f| require f}

config = YAML.load_file("#{File.dirname(__FILE__)}/../config/database.yml")["test"]
ActiveRecord::Base.establish_connection config

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = false

  # Include Factory Girl syntax to simplify calls to factories
  config.include FactoryGirl::Syntax::Methods
end
