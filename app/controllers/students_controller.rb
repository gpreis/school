class StudentsController < BaseController

  #index, new, create, edit, update, and destroy from BaseController

  private
    def model_class
      Student
    end

    def model_params
      params.require(:student).permit(:name, :register_number)
    end
end