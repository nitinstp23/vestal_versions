class Student < ActiveRecord::Base
  has_many :lessons
end
