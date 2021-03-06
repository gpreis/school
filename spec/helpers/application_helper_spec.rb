require 'rails_helper'

describe ApplicationHelper do
  let(:student) { create(:student) }
  let(:course) { create(:course) }

  before(:each) { render text: subject }

  describe '#show_link' do
    context 'when the object is a student' do
      subject { helper.show_link(student) }

      it { assert_select 'a', text: 'Detalhes', with: { href: student_url(student) } }
    end

    context 'when the object is a course' do
      subject { helper.show_link(course) }

      it { assert_select 'a', text: 'Detalhes', with: { href: course_url(course) } }
    end
  end

  describe '#delete_link' do
    context 'when the object is a student' do
      subject { helper.delete_link(student) }

      it { assert_select 'a', text: 'Excluir', with: { href: student_url(student), method: :delete } }
    end
    context 'when the object is a course' do
      subject { helper.delete_link(course) }

      it { assert_select 'a', text: 'Excluir', with: { href: course_url(course), method: :delete } }
    end
  end

  describe '#back_button' do
    context 'when the klass is Student' do
      subject { helper.back_button(Student) }

      it { assert_select 'a', text: 'Voltar', with: { href: students_url } }
    end
    context 'when the klass is Course' do
      subject { helper.back_button(Course) }

      it { assert_select 'a', text: 'Voltar', with: { href: courses_url } }
    end
    context 'when the klass is Classroom' do
      subject { helper.back_button(Classroom) }

      it { assert_select 'a', text: 'Voltar', with: { href: classrooms_url } }
    end
  end
end