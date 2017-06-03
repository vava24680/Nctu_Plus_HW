class Department < ApplicationRecord
    has_many :announcements, :dependent=>:destroy
    validates_presence_of :d_name
    validates_uniqueness_of :d_name
end
