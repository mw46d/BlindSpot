class CourseEvaluation < ActiveRecord::Base
  belongs_to :course
  has_many :notes, :dependent => :destroy
end
