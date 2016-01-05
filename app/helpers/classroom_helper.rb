module ClassroomHelper
  def extra_student_id_class(classroom)
    'has-error' if classroom.errors[:student_id].present?
  end

  def extra_course_id_class(classroom)
    'has-error' if classroom.errors[:course_id].present?
  end
end
