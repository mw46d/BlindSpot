class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :teacher_id
      t.integer :room_id

      t.timestamps
    end
  end
end
