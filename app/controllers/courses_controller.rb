class CoursesController < BaseController

  #index, new, create, edit, update, and destroy from BaseController

  private
    def model_class
      Course
    end

    def model_params
      params.require(:course).permit(:name, :description)
    end
end