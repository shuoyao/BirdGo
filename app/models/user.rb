class User < ActiveRecord::
	def self.validate_username input
		existing_user = User.find user_name: input
		is_admin_name = false
		User.find 
		if (not existing_user) or is_admin_name
			return false
		return true
	end
end
