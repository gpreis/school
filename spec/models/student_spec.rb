require 'rails_helper'

describe Student do
  describe 'associations' do
    it { is_expected.to have_many(:classrooms).dependent(:destroy) }
    it { is_expected.to have_many(:courses).through(:classrooms) }
  end

  describe 'validations' do
    subject { create(:student) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:register_number) }
    it { is_expected.to validate_uniqueness_of(:register_number) }
    it { is_expected.to validate_numericality_of(:status) }
  end

  describe '#to_s' do
    let(:student) { build(:student) }
    let(:to_s) { [student.name, student.register_number].join(' – ') }
    subject { student.to_s }

    it { is_expected.to eq(to_s) }
  end
end
