class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :name, null: false
    	t.string :register_number, null: false
    	t.integer :status
    end

    add_index :students, :register_number, unique: true
  end
end
