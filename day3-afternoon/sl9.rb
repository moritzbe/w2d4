require 'sinatra'
require "sinatra/reloader" if development?
require 'pp'

set :port, 3000

visits ||= 0

class Songlist
	def initialize
	@songs =[]
	end

 	def add_song(item)
 		@songs << item
 	end

 	def artist(artist)

 	end
 end


get('/') do
	visits += 1
  	@visits = visits
  	recorder = Songlist.new
  	if @songs.size >=3 
  		redirect('/enough2')
  	else
  	erb(:sl9)
  end
end

post('/') do
	item = []
	#item << {title: params[:title], author: params[:author] }
	item << params[:title]
	item << params[:author] 
	recorder.add_song(item)
	redirect('/')
end

get '/enough2' do

	erb :enough2
end

get '/artists/:artists' do
	@artists = params[:artists]
	@songs.select do |array| array[1] = @artists end
 	@songs.each do |item| item[0] end

  erb :artists
end


