module StudentHelper
  def edit_student_link(student)
    link_to 'Alterar', edit_student_url(student)
  end

  def action_student_links(student)
    [show_link(student), edit_student_link(student), delete_link(student)].join(' | ').html_safe
  end
end
