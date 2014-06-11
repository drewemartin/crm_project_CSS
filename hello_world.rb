require 'sinatra'

get '/' do
	puts params #collects query parameters w/in a hash (ie ?hello=worl&go=stop)
	puts
  "Hello World!"
end

get '/:name'do #DRY version instead of dealing w/ each name
@name = params[:name].capitalize
erb :name
end

# get '/zach' do
# # 	"hi i'm zach"
# # end

# # get '/sebastian' do
# # 	"hi i'm sebastian"
# # end