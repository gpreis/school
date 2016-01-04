class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.references :student, null: false
      t.references :course, null: false
      t.timestamps
    end

    add_index :classrooms, :student_id
    add_index :classrooms, :course_id
  end
end
