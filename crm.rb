require 'sinatra'
require_relative 'contact_class'
require_relative 'rolodex_class'

@@rolodex = Rolodex.new
@@rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

get '/' do 
	@crm_app_name = "Drew Martin"
	@current_time = Time.now
	erb :index
end

get '/contacts' do
	@contacts = @@rolodex.contacts
	erb :contacts
end



get '/contacts/new' do

	erb :add_contacts
end

get "/contacts/1000" do
	@contact = @@rolodex.find(1000)
	erb :show_contact
end

get '/contacts/:id' 
	@contact = @@rolodex.find(params[:id].to_i)
	erb :show_contact
end

# get '/contacts/:id/edit' #find and edit unique contact

# end

post '/contacts' do
puts params
new_contact = Contact.new(params[:first_name], params[:last_name], params[:email_address], params[:notes])
@@rolodex.add_contact(new_contact)
redirect '/contacts'
end