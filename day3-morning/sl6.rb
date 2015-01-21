require 'sinatra'
require "sinatra/reloader" if development?
require 'pp'

set :port, 3010

songs = Array.new

get '/' do
	p songs
end

post '/songs/new'	do
	songs << "#{params[:song]}, #{params[:artist]}"
	# redirect (songs.size >= 2 ? '/' : '/enough')
	if songs.size >= 10
		redirect '/enough'
	else
		redirect '/'
	end
end

get '/enough' do
	"IS WORTH F***ING NOTHING"
end
