# - Also in “/“, there’s a form (pointing to “/signup”) with 
#which you can sign up yourself. After you sign up, your user 
#id (and your
# id only) is saved in session, and you can see it in the top 
#(hint: use an internal data structure were you can save ids 
	#with their corresponding names and, important: ids should 
	#be incremental and not repeat).










require 'sinatra'
require "sinatra/reloader" if development?
require 'pp'


set :port, 3000

enable :sessions

class Activists
	attr_accessor :activists, :users, :user_id
	def initialize
	@activists = []
	@users ||= 0
	@user_id ||= 0	
	end

 	def add_activist(activist)
 		@users += 1
 		@activists << activist
 	end

 	def add_id
 		@user_id += 1
 	end

end

subscriber = Activists.new

get('/') do
	
	@activists = subscriber.activists
	@number_of_users = subscriber.users
	@thing = session[:user_id]

  	erb(:sl11)
end




get('/signup') do
	
	@activists = subscriber.activists
	@number_of_users = subscriber.users
	subscriber.add_id
	session[:user_id] = subscriber.user_id
  	erb(:signup)
end

post('/signup') do
	subscriber.add_activist(params[:name])
	redirect('/')
end




get('/dogs') do

   	erb(:dogs)
end



