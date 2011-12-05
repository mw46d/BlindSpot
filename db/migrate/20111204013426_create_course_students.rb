class CreateCourseStudents < ActiveRecord::Migration
  def change
    create_table :course_students do |t|
      t.float :position_x
      t.float :position_y
      t.integer :student_id
      t.integer :course_id

      t.timestamps
    end
  end
end
