require_relative './config/environment'
require 'sinatra/activerecord/rake'
# require 'rake'
# require 'active_record'

# task :environment do
#   ENV["ACTIVE_RECORD_ENV"] ||= "development"
#   require_relative './config/environment'
# end

# include ActiveRecord::Tasks
# DatabaseTasks.db_dir = 'db'
# DatabaseTasks.migrations_paths = 'db/migrate'

# desc 'seed the database'
# task :seed do
#   require_relative 'db/seeds.rb'
# end

# desc 'starts a console'
# task :console do
#   ActiveRecord::Base.logger = Logger.new(STDOUT)
#   Pry.start
# end

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end

desc 'creates database, runs migrations, seeds data, and starts app'
task :prepare_database do 
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
  Rake::Task['db:seed'].invoke
  ruby "bin/run.rb"
end

desc 'starts app'
task :enter do 
  ruby "bin/run.rb"
end