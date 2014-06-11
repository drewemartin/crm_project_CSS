class Contact

	attr_accessor :id, :first_name, :last_name, :email_address, :notes

	def initialize(first_name, last_name, email_address, notes)
		@first_name = first_name
		@last_name = last_name
		@email_address = email_address
		@notes
	end

	def to_s
		"#{first_name}, #{last_name}, #{email_address}, #{notes}"
	end
end