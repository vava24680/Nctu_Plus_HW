class AnnouncementsController < ApplicationController
    before_action :find_announcement, :only=>:show
    def index
        @page_title = "Bulletin Board"
        @announcements = Announcement.all
    end
    def show
        @page_title = @announcement.title
    end

private
    def find_announcement
        @announcement = Announcement.find(params[:id])
    end
end
