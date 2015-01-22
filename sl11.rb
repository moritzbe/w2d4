# - In “/“, you can see the list of users (showing their name) 
#that have signed up and the number of users.
# - Also in “/“, there’s a form (pointing to “/signup”) with 
#which you can sign up yourself. After you sign up, your user 
#id (and your
# id only) is saved in session, and you can see it in the top 
#(hint: use an internal data structure were you can save ids 
	#with their corresponding names and, important: ids should 
	#be incremental and not repeat).
# - There also a “/cats” page, linked from “/“, with five 
#pictures of cats of your choice. Do your best!


require 'rubygems'
require 'active_record'
require 'sinatra'
require "sinatra/reloader" if development?
require 'pp'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'activerecord.sqlite'
)

class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 16

  validates_presence_of :name, :surnames
  validates_format_of :website, with: /\Ahttp:/
  validates_numericality_of :number_of_dogs, greater_than: 0
  validate :proper_age

  private

  def proper_age
    unless birthday < AGE_MINIMUM.years.ago
      errors.add(:birthday, 'is too young')
    end
  end
end




get('/') do
	# visits += 1
 #  	@visits = visits
 #  	recorder = Songlist.new
  	# if @songs.size >=3 
  	# 	redirect('/enough2')
  	# else
  	erb(:sl11)
end

get('/dogs') do
	# visits += 1
 #  	@visits = visits
 #  	recorder = Songlist.new
  	# if @songs.size >=3 
  	# 	redirect('/enough2')
  	# else
  	erb(:sl11)
end



