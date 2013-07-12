require 'active_record'
require 'yaml'

namespace :db do
  task :environment do
    DATABASE_ENV = ENV['DATABASE_ENV'] || 'development'
    MIGRATIONS_DIR = ENV['MIGRATIONS_DIR'] || 'db/migrate'
  end
 
  task :configuration => :environment do
    @config = YAML.load_file('config/database.yml')[DATABASE_ENV]
  end
 
  task :configure_connection => :configuration do
    ActiveRecord::Base.establish_connection @config
  end
 
  desc 'Create the database from config/database.yml for the current DATABASE_ENV'
  task :create => :configure_connection do
    options = {:charset => 'utf8', :collation => 'utf8_unicode_ci'}
 
    create_db = lambda do |config|
      $stdout.puts "Creating database #{config["database"]}..."
      ActiveRecord::Base.establish_connection config.merge('database' => nil)
      ActiveRecord::Base.connection.create_database config['database'], options
      ActiveRecord::Base.establish_connection config
    end

    begin
      create_db.call @config
    rescue => err
      $stderr.puts err.message
      exit
    end
  end
 
  desc 'Migrate the database (options: VERSION=x, VERBOSE=false).'
  task :migrate => :configure_connection do
    migrate_db = lambda do |version|
      $stdout.puts "Running migrations..."
      ActiveRecord::Migration.verbose = true
      ActiveRecord::Migrator.migrate MIGRATIONS_DIR, version ? version.to_i : nil
    end

    begin
      migrate_db.call ENV['VERSION']
    rescue => err
      $stderr.puts err.message
      exit
    end
  end
 
  desc 'Drops the database for the current DATABASE_ENV'
  task :drop => :configure_connection do
    drop_db = lambda do |config|
      $stdout.puts "Dropping database #{config["database"]}..."
      ActiveRecord::Base.connection.drop_database config['database']
    end

    begin
      drop_db.call @config 
    rescue => err
      $stderr.puts err.message
    end
  end

  task :reset => [:drop, :create, :migrate]
  task :all => [:create, :migrate]

  namespace :test do
    task :create do
      ENV['DATABASE_ENV'] = 'test' 
      Rake::Task['db:create'].invoke
    end

    task :migrate do
      ENV['DATABASE_ENV'] = 'test' 
      Rake::Task['db:migrate'].invoke
    end

    task :drop do
      ENV['DATABASE_ENV'] = 'test' 
      Rake::Task['db:drop'].invoke
    end

    task :reset => [:drop, :create, :migrate]
    task :all => [:create, :migrate]
  end
end
