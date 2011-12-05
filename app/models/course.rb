class Course < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :room
  has_many :course_students, :dependent => :destroy
  has_many :course_evaluations, :dependent => :destroy
  
  def update_students(id_array)
    course_students.each do |cs|
      if id_array.include?(cs.student.id.to_s)
        while id_array.delete(cs.student.id.to_s)
          # Remove the elements
        end
      else
        return false unless cs.destroy
      end
    end
    
    id_array.each do |s_id|
      if s = Student.find(s_id)
        cs = CourseStudent.create(:course => self, :student => s)
          
        return false unless cs
      end
    end
    
    true
  end
end
