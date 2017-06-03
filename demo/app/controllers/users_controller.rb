class UsersController < ApplicationController
    before_action :check
    before_action :find_user, :only=>[:show,:edit,:update]
    def index
        if logged_in
            @id=get_id
            redirect_to user_path(@id)
        else
            redirect_to user_announcements_url
        end
    end
    def new
        if logged_in
            flash[:alert] = "You are already a user."
            redirect_to user_announcements_url
        else
            @page_title = "New an User"
            @user=User.new
        end
    end
    def show
        if logged_in
            @page_title = @user.name+"'s profile"
        else
            flash[:alert] = "No authorized User."
            redirect_to announcements_url,:method=>:get
        end
    end
    def create
        @user=User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome~"
            #redirect_to user_path(@user), :method=>:get
            log_in(@user)
            redirect_to user_announcements_path, :method=>:get
        else
            render :action=>:new
        end
    end
    def edit
        @page_title = "Edit "+@user.name+"'s profile"
    end
    def update
        if @user.update(user_name_email_params)
            flash[:notice] = "Successfully updated..."
            redirect_to user_path(@user), :method=>:get
        else
            flash[:alert] = "Something Wrong"
            render :action=>:edit
        end
    end
    def allpost
        if logged_in
            @user_id = get_id
            @announcements = Announcement.where(:user_id=>@user_id)
        else
            redirect_to announcements_url, :method=>:get
        end
    end
private
    def find_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:name,:email,:account,:password,:password_confirmation)
    end
    def user_name_email_params
        params.require(:user).permit(:name,:email)
    end
    def check
        if(!logged_in)
            redirect_to announcements_url,:method=>:get
        end
    end
end
