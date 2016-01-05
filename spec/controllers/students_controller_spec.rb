require 'rails_helper'

describe StudentsController do
  describe '#new' do
    before(:each) { get :new }

    it 'renders the new template' do
      expect(response).to render_template('new')
    end

    it 'assigns @model' do
      expect(assigns(:model)).to be_a_new(Student)
    end
  end

  describe '#edit' do
    let(:student) { create(:student) }
    before(:each) { get :edit, id: student.id }

    it 'renders the edit template' do
      expect(response).to render_template('edit')
    end

    it 'assigns @model' do
      expect(assigns(:model)).to eq(student)
    end
  end

  describe '#index' do
    let!(:student) { create(:student) }
    before(:each) { get :index }

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'assigns @models' do
      expect(assigns(:models)).to eq(Student.all)
    end
  end

  describe '#create' do
    let(:student) { build(:student) }
    let(:params) { {student: student.attributes.slice('name', 'register_number')} }

    it 'requires the student params' do
      invalid_params = {name: 'teste'}
      expect { post :create, invalid_params }.to raise_error(ActionController::ParameterMissing)
    end

    context 'when student is created' do
      let(:student) { build(:student) }

      before(:each) do
        post :create, params
      end

      it 'sets a success flash message' do
        expect(flash[:success]).to eq('Estudante criado com sucesso!')
      end

      it 'redirects to the students index' do
        expect(response).to redirect_to(students_path)
      end
    end

    context 'when student is not created' do
      let(:student) { build(:student, name: '') } # invalid CPF

      before(:each) do
        expect_any_instance_of(Student).to receive(:save).and_return(false)
        post :create, params
      end

      it 'sets an error flash message' do
        expect(flash[:danger]).to eq('Não foi possível criar o Estudante, veja os erros abaixo!')
      end

      it 'renders the new page again' do
        expect(response).to render_template('new')
      end

      it 'assigned @model to have errors' do
        expect(assigns(:model)).to_not be_valid
      end
    end
  end

  describe '#update' do
    let(:student) { create(:student) }

    it 'finds the requested student' do
      put :update, id: student.id, student: {foo: 'bar'}
      expect(assigns(:model)).to eql(student)
    end

    it 'raise error when trying to access a inexistent student' do
      expect{ put :update, id: 0, student: {foo: 'bar'} }.to raise_error(ActiveRecord::RecordNotFound)
    end

    context 'when Student is updated' do
      let(:student_params) { student.attributes.slice('name', 'register_number') }

      before(:each) do
        expect_any_instance_of(Student).to receive(:update).with(student_params).and_return(true)
        put :update, id: student.id, student: student_params
      end

      it 'sets a success flash message' do
        expect(flash[:success]).to eq('Estudante alterado com sucesso!')
      end

      it 'redirects to the students index' do
        expect(response).to redirect_to(students_path)
      end
    end

    context 'when Student is not updated' do
      let(:student) { create(:student) }
      let(:student_params) { student.attributes.slice('name', 'register_number').update('name' => '') } # invalid name

      before(:each) do
        expect_any_instance_of(Student).to receive(:update).with(student_params).and_return(false)
        put :update, id: student.id, student: student_params
      end

      it 'sets an error flash message' do
        expect(flash[:danger]).to eq('Não foi possível alterar o Estudante, veja os erros abaixo!')
      end

      it 'renders the edit again' do
        expect(response).to render_template('edit')
      end
    end
  end
end