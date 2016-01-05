require 'rails_helper'

describe ClassroomHelper do
  let(:classroom) { double(:classroom) }

  describe '#extra_student_id_class' do
    subject { helper.extra_student_id_class(classroom) }

    context 'when student id has errors' do
      let(:errors) { { student_id: 'anything' } }
      before(:each) { allow(classroom).to receive(:errors).and_return(errors) }

      it { is_expected.to eq('has-error') }
    end

    context 'when student id does not have errors' do
      before(:each) { allow(classroom).to receive(:errors).and_return({}) }

      it { is_expected.to be_nil }
    end
  end

  describe '#extra_course_id_class' do
    subject { helper.extra_course_id_class(classroom) }

    context 'when course id has errors' do
      let(:errors) { { course_id: 'anything' } }
      before(:each) { allow(classroom).to receive(:errors).and_return(errors) }

      it { is_expected.to eq('has-error') }
    end

    context 'when course id does not have errors' do
      before(:each) { allow(classroom).to receive(:errors).and_return({}) }

      it { is_expected.to be_nil }
    end
  end
end
