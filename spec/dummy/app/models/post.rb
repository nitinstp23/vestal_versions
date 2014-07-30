class Post < ActiveRecord::Base
	belongs_to :user

  versioned
end
