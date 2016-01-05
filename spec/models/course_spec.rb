require 'rails_helper'

describe Course do
  describe 'associations' do
    it { is_expected.to have_many(:classrooms).dependent(:destroy) }
  end

  describe 'validations' do
    subject { create(:course) }
    
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_numericality_of(:status) }
  end
end