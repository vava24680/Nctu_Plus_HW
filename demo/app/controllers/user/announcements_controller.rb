class User::AnnouncementsController < ApplicationController
	before_action :check
    before_action :find_announcement,:only=>[:show,:edit,:destroy,:update]
    def index
		@page_title = "Bulletin Board"
        @announcements = Announcement.all
    end
    def new
		@page_title = "New a New Announcement"
        @announcement = Announcement.new
    end
    def create
        @announcement = Announcement.new(announcement_params)
		@announcement.user_id = get_id
        if @announcement.save
            flash[:notice] = "A new announcement has been created successfully"
            redirect_to user_announcements_path
        else
            flash[:alert] = "Some field is not complete. Please retype again, thanks"
            render :action=>:new
        end
    end
    def show
		@page_title = @announcement.title
    end
    def edit
		if get_id==@announcement.user_id
			@page_title = "Edit "+@announcement.title
		else
			flash[:alert] = "Sorry about that, You are not the user who created this announcement"
			redirect_to user_announcements_path, :method=>:get
		end
    end
    def update
        if @announcement.update(announcement_params)
            flash[:notice] = "The announcement has been updated successfully"
            redirect_to user_announcements_path
        else
            flash[:alert] = "Some field is not complete. Please retype again, thanks"
            render :action=>:edit
        end
    end
    def destroy
		if get_id==@announcement.user_id
	        @announcement.destroy
	        flash[:notice] = "The announcement has been removed successfully"
	        redirect_to user_announcements_path
		else
			flash[:alert] = "Sorry about that, You are not the user who created this announcement"
			redirect_to user_announcements_path, :method=>:get
		end
    end
private
    def find_announcement
        @announcement = Announcement.find(params[:id])
    end
    def announcement_params
        params.require(:announcement).permit(:title,:content,:department_id,:user_id)
    end
    def check
        if !logged_in
            redirect_to announcements_url
        end
    end
end
