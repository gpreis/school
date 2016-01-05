module ClassroomHelper
  def extra_student_id_class
    "has-error" if @model.errors[:student_id].present?
  end

  def extra_course_id_class
    "has-error" if @model.errors[:course_id].present?
  end
end