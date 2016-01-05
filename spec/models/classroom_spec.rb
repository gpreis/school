require 'rails_helper'

describe Classroom do
  describe 'associations' do
    it { is_expected.to belong_to(:student) } 
    it { is_expected.to belong_to(:student) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:student_id) }
    it { is_expected.to validate_presence_of(:course_id) }
  end
end