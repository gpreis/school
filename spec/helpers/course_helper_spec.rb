require 'rails_helper'

describe CourseHelper do
  let(:course) { create(:course) }

  before(:each) { render text: subject }

  describe '#edit_course_link' do
    subject { helper.edit_course_link(course) }

    it { assert_select 'a', text: 'Alterar', with: { href: edit_course_url(course) } }
  end

  describe '#action_course_links' do
    subject { helper.action_course_links(course).split('|').size }

    it 'calls the links methods' do
      expect(helper).to receive(:show_link).with(course)
      expect(helper).to receive(:edit_course_link).with(course)
      expect(helper).to receive(:delete_link).with(course)
      helper.action_course_links(course)
    end

    it 'should have three parts splitteds by pipe' do
      expect(subject).to eq(3)
    end
  end
end
