class CreateCourseEvaluations < ActiveRecord::Migration
  def change
    create_table :course_evaluations do |t|
      t.string :name
      t.datetime :date
      t.integer :course_id

      t.timestamps
    end
  end
end
