ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  set :database, 'sqlite3:db/development.sqlite'
end

configure :test do
  set :database, 'sqlite3:db/test.sqlite'
end

configure :production do
  set :database, ENV['DATABASE_URL']
end

require_all 'app'
