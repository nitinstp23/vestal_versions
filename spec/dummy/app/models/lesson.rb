class Lesson < ActiveRecord::Base
  belongs_to :student

  versioned
end
