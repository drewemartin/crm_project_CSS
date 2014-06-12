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


get '/contacts/:id' do
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact 
		erb :show_contact
	else
		puts "Im not found"
		raise Sinatra::NotFound
	end
end

get '/contacts/:id/edit' do #find and edit unique contact
	@contact = @@rolodex.find(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		puts "Im not found"
		raise Sinatra::NotFound
	end
end

post '/contacts' do
puts params
new_contact = Contact.new(params[:first_name], params[:last_name], params[:email_address], params[:notes])
@@rolodex.add_contact(new_contact)
redirect '/contacts'
end

put '/contacts/:id' do
	@contact = @@rolodex.find(params[:id].to_i)

	if @contact
		@contact.first_name = params[:first_name]
		@contact.last_name = params[:last_name]
		@contact.email_address = params[:email_address]
		@contact.notes = params[:notes]
		redirect '/contacts'
	else
		raise Sinatra::NotFound
	end
end



delete "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @@rolodex.remove_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end












