require 'sequel'
require 'telegram/bot'
require 'json'
require 'sinatra'

set :views, settings.root + '/views'
DB = Sequel.connect('sqlite://pr.db')

get '/' do
	'visit /requests'
end

get '/requests' do
	request_table = DB[:pull_request]
	requests = request_table.all
	haml :index, :locals => {:reqs => requests}
end

get '/requests/:creator' do 
end

post '/gh-event' do
	logger.info "got request: #{params}"
end