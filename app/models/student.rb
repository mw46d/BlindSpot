class Student < ActiveRecord::Base
  has_many :courses
  has_many :notes, :dependent => :destroy
end
