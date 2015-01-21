require 'sinatra'
require "sinatra/reloader" if development?
require 'pp'

set :port, 3011

songs = Hash.new

get '/' do
	"Here I am showing Sinatras songs"
	if songs.length >= 3
		redirect '/enough'
	else
		p songs.to_s
	end
end

post '/songs/new'	do
	songs["#{params[:song]}"] = "#{params[:artist]}"
redirect '/'

	if songs.length >= 3
		redirect '/enough'
	else
		redirect '/'
	end
end

get '/enough' do
	"IS WORTH F***ING NOTHING"
end
