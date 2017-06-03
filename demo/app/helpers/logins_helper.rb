module LoginsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
    def current_user
        #User.find_by(:id=>session[:user_id])
        if @current_user.nil?
            @current_user = User.find_by(:id=>session[:user_id])
        else
            @current_user
        end
        #@current_user ||=User.find_by(:id=>session[:user_id])
    end
	def get_id
		session[:user_id]
	end
    #check is there is a current_user
    def logged_in
        !current_user.nil?
        #!(@current_user.nil?)
    end
    def logged_out
        current_user.nil?
    end
end
