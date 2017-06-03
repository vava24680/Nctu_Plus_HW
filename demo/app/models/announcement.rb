class Announcement < ApplicationRecord
    belongs_to :department
    belongs_to :user
    validates_presence_of :title, :content
end
