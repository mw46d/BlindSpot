class Note < ActiveRecord::Base
  belongs_to :course_evaluation
  belongs_to :student
end
