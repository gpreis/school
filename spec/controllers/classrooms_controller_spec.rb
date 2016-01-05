require 'rails_helper'

describe ClassroomsController do
  describe '#new' do
    before(:each) { get :new }

    it 'renders the new template' do
      expect(response).to render_template('new')
    end

    it 'assigns @model' do
      expect(assigns(:model)).to be_a_new(Classroom)
    end
  end

  describe '#edit' do
    it 'redirect to index' do
      get :edit, id: 1
      expect(response).to redirect_to(classrooms_path)
    end
  end

  describe '#index' do
    let!(:classroom) { create(:classroom) }
    before(:each) { get :index }

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'assigns @models' do
      expect(assigns(:models)).to eq(Classroom.all)
    end
  end

  describe '#create' do
    let(:classroom) { build(:classroom) }
    let(:params) { { classroom: classroom.attributes.slice('student_id', 'course_id') } }

    it 'requires the classroom params' do
      invalid_params = { name: 'teste' }
      expect { post :create, invalid_params }.to raise_error(ActionController::ParameterMissing)
    end

    context 'when classroom is created' do
      let(:classroom) { build(:classroom) }

      before(:each) do
        post :create, params
      end

      it 'sets a success flash message' do
        expect(flash[:success]).to eq('Matrícula criado com sucesso!')
      end

      it 'redirects to the classrooms index' do
        expect(response).to redirect_to(classrooms_path)
      end
    end

    context 'when classroom is not created' do
      let(:classroom) { build(:classroom, student: nil) }

      before(:each) do
        expect_any_instance_of(Classroom).to receive(:save).and_return(false)
        post :create, params
      end

      it 'sets an error flash message' do
        expect(flash[:danger]).to eq('Não foi possível criar o Matrícula, veja os erros abaixo!')
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
    it 'redirect to index' do
      get :edit, id: 1
      expect(response).to redirect_to(classrooms_path)
    end
  end

  describe '#destroy' do
    let(:classroom) { create(:classroom) }

    it 'finds the requested classroom' do
      delete :destroy, id: classroom.id
      expect(assigns(:model)).to eq(classroom)
    end

    context 'when Classroom is deleted' do
      before(:each) do
        expect_any_instance_of(Classroom).to receive(:destroy!)
        delete :destroy, id: classroom.id
      end

      it 'sets a success flash message' do
        expect(flash[:success]).to eq('Matrícula excluído com sucesso!')
      end

      it 'redirects to the classrooms page' do
        expect(response).to redirect_to(classrooms_path)
      end
    end
  end
end
