class CreateTeachers < ActiveRecord::Migration
  def up
    create_table "teachers", :force => true do |t|
      t.string   "name",         :limit => 64
      t.timestamps
    end
  end

  def down
    drop_tabe "teachers"
  end
end
