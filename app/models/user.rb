class User < ActiveRecord::

	# true if input is valid
	def self.validate_username input
		existing_user = User.find user_name: input
		is_admin_name = false
		User.where(reserved: true).find_each do |user|
			is_match = (user.user_name == input)
			if is_match
				is_admin_name = true
			end
		end
		if (not existing_user) or is_admin_name
			return false
		return true
	end
end
