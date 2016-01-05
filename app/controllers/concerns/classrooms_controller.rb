class ClassroomsController < BaseController
  before_action :find_model, only: [:update, :edit, :destroy]

  #index, new, create, and destroy from BaseController

  def edit
    redirect_to classrooms_path
  end

  def update
    redirect_to classrooms_path
  end

  private
    def model_class
      Classroom
    end

    def model_params
      params.require(:classroom).permit(:student_id, :course_id)
    end
end