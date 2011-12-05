class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :course_evaluation_id
      t.integer :student_id

      t.timestamps
    end
  end
end
