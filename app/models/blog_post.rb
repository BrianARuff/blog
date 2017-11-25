class BlogPost < ApplicationRecord
	validates :blog_entry, presence: true, uniqueness: true, length: {maximum: 288, minimum: 30, too_short: "Must contain at least 30 characters", too_long: "Must not exceed 288 characters."}
	validates :title, presence: true
	validates :author, presence: true
	
	has_many :comments, dependent: :destroy
end
