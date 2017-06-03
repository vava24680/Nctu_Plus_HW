class LoginsController < ApplicationController
    def new#since login has no model, no instance variable.
        @page_title = "Login"
    end

    def create
        #render :action=>:new
        #Nested hash
        user = User.find_by(:account=>params[:session][:account])
        if user && user.authenticate(params[:session][:password])
            log_in(user)
            #redirect_to announcements_url, :method=>:get
            redirect_to user_announcements_path, :method=>:get
        else
            flash.now[:alert] = "Invalid account/password"
            #now means that the flash will not be available to the next action
            render :action=>:new
        end
    end

    def destroy
        log_out
        redirect_to announcements_url, :method=>:get
    end

private
    def login_params
        params.require(:session).permit(:account,:password)
    end
end
