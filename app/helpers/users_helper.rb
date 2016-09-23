module UsersHelper
	def sti_users_path(user_type = "user", user = nil, action = nil)
		send "#{format_sti(action, user_type, user)}_path", user
	end

	def format_sti(action, user_type, user)
		action || user ? "#{format_action(action)}#{user_type.underscore}" : "#{user_type.underscore.pluralize}"
	end

	def format_action(action)
		action ? "#{action}_" : ""
	end
end