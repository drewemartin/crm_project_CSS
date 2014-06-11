require 'sinatra'
require_relative 'contact_class'
require_relative 'rolodex_class'

@@rolodex = Rolodex.new

get '/' do 
	@crm_app_name = "Drew Martin"
	@current_time = Time.now
	erb :index
end

get '/contacts' do
	erb :contacts
end



get '/contacts/new' do

	erb :add_contacts
end

# get '/contacts/:id' #view a contact, this choice has to come last since it could overwrite others

# end

# get '/contacts/:id/edit' #find and edit unique contact

# end

post '/contacts' do
puts params
new_contact = Contact.new(params[:first_name], params[:last_name], params[:email_address], params[:notes])
@@rolodex.add_contact(new_contact)
redirect '/contacts'
end