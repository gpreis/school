require 'rails_helper'

describe StudentHelper do
  let(:student) { create(:student) }

  before(:each) { render text: subject }

  describe '#edit_student_link' do
    subject { helper.edit_student_link(student) }

    it { assert_select 'a', text: 'Alterar', with: { href: edit_student_url(student) } }
  end

  describe '#action_student_links' do
    subject { helper.action_student_links(student).split('|').size }

    it 'calls the links methods' do
      expect(helper).to receive(:show_link).with(student)
      expect(helper).to receive(:edit_student_link).with(student)
      expect(helper).to receive(:delete_link).with(student)
      helper.action_student_links(student)
    end

    it 'should have three parts splitteds by pipe' do
      expect(subject).to eq(3)
    end
  end
end
