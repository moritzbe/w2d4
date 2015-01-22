require 'rubygems'
require 'active_record'
require 'sinatra'
require "sinatra/reloader" if development?
require 'pp'

enable :sessions

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'students.sqlite'
)
I18n.enforce_available_locales = false 

set :port, 3000

enable :sessions



class Student < ActiveRecord::Base
	#attr_reader(:students)
end



get('/') do
  	@students = Student.all
  	erb(:oc4)
end

get('/only_dog_owners') do
	@students = Student.all
	@students = @students.where(:number_of_dogs => (1..Float::INFINITY) )
  	erb(:oc4)
end


post('/') do 
	Student.create(name: params[:name], surnames: params[:surnames], birthday: params[:birthday], number_of_dogs: params[:number_of_dogs], website: params[:website], first_programming_experience: params[:first_programming_experience])
 	redirect('/')
end


