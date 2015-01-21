require 'sinatra'
require 'sinatra/reloader'

class Songs
	def initialize
		@song_list = []
	end

	def add_song(title, artist)
		unless @song_list.size >= 10
			@song_list.push([title, artist])
		end
	end

	def to_s
		@song_list.to_s
	end

	def song_list
		@song_list.length
	end
end

sing_song = Songs.new

sing_song.add_song('Name', 'Artist')
sing_song.add_song('====', '======')


set :port, 3000
set :bind, '0.0.0.0'

visits ||= 0 

get '/' do
	# a_var = ""

	# sing_song.songs.each do |list_arr|

	# 	a_var += list_arr[0].to_s + ' ' + list_arr[1].to_s + '<br>'
	# end

	# "#{a_var}"

	sing_song.to_s
end

post '/songs/new' do
	if sing_song.song_list >= 10
		redirect '/enough'
	else
		sing_song.add_song(params["title"], params["artist"])
		redirect '/'
	end
end

get '/enough' do
	"This music is worth fucking nothing!  Regards, Frank"
end

# curl -L --data "title=TheHandsomeFamily&artist=FarFromAnyRoad" "localhost:3000/songs/new"



