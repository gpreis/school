require 'rails_helper'

describe CoursesController do
  describe '#new' do
    before(:each) { get :new }

    it 'renders the new template' do
      expect(response).to render_template('new')
    end

    it 'assigns @model' do
      expect(assigns(:model)).to be_a_new(Course)
    end
  end

  describe '#edit' do
    let(:course) { create(:course) }
    before(:each) { get :edit, id: course.id }

    it 'renders the edit template' do
      expect(response).to render_template('edit')
    end

    it 'assigns @model' do
      expect(assigns(:model)).to eq(course)
    end
  end

  describe '#index' do
    let!(:course) { create(:course) }
    before(:each) { get :index }

    it 'renders the index template' do
      expect(response).to render_template('index')
    end

    it 'assigns @models' do
      expect(assigns(:models)).to eq(Course.all)
    end
  end

  describe '#create' do
    let(:course) { build(:course) }
    let(:params) { {course: course.attributes.slice('name', 'description')} }

    it 'requires the course params' do
      invalid_params = {name: 'teste'}
      expect { post :create, invalid_params }.to raise_error(ActionController::ParameterMissing)
    end

    context 'when course is created' do
      let(:course) { build(:course) }

      before(:each) do
        post :create, params
      end

      it 'sets a success flash message' do
        expect(flash[:success]).to eq('Curso criado com sucesso!')
      end

      it 'redirects to the courses index' do
        expect(response).to redirect_to(courses_path)
      end
    end

    context 'when course is not created' do
      let(:course) { build(:course, name: '') } # invalid CPF

      before(:each) do
        expect_any_instance_of(Course).to receive(:save).and_return(false)
        post :create, params
      end

      it 'sets an error flash message' do
        expect(flash[:danger]).to eq('Não foi possível criar o Curso, veja os erros abaixo!')
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
    let(:course) { create(:course) }

    it 'finds the requested course' do
      put :update, id: course.id, course: {foo: 'bar'}
      expect(assigns(:model)).to eql(course)
    end

    it 'raise error when trying to access a inexistent course' do
      expect{ put :update, id: 0, course: {foo: 'bar'} }.to raise_error(ActiveRecord::RecordNotFound)
    end

    context 'when Course is updated' do
      let(:course_params) { course.attributes.slice('name', 'description') }

      before(:each) do
        expect_any_instance_of(Course).to receive(:update).with(course_params).and_return(true)
        put :update, id: course.id, course: course_params
      end

      it 'sets a success flash message' do
        expect(flash[:success]).to eq('Curso alterado com sucesso!')
      end

      it 'redirects to the courses index' do
        expect(response).to redirect_to(courses_path)
      end
    end

    context 'when Course is not updated' do
      let(:course) { create(:course) }
      let(:course_params) { course.attributes.slice('name', 'description').update('name' => '') } # invalid name

      before(:each) do
        expect_any_instance_of(Course).to receive(:update).with(course_params).and_return(false)
        put :update, id: course.id, course: course_params
      end

      it 'sets an error flash message' do
        expect(flash[:danger]).to eq('Não foi possível alterar o Curso, veja os erros abaixo!')
      end

      it 'renders the edit again' do
        expect(response).to render_template('edit')
      end
    end
  end
end