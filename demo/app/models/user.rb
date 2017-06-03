class User < ApplicationRecord
    validates_presence_of :name, :account, :email
    validates_presence_of :password, :on=>:create
    validates_length_of :name, maximum: 50
    validates_length_of :account, in: 8..16
    validates_length_of :password, in: 8..20,:on=>:create
    validates_length_of :email, maximum: 255
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates_format_of :email, with:VALID_EMAIL_REGEX
    validates_uniqueness_of :account
    has_secure_password
    has_many :announcements
end
