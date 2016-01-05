module CourseHelper
  def edit_course_link(course)
    link_to 'Alterar', edit_course_path(course)
  end

  def action_course_links(course)
    [show_link(course), edit_course_link(course), delete_link(course)].join(' | ').html_safe
  end
end
