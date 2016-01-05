class BaseController < ApplicationController
  before_action :find_model, only: [:update, :edit, :destroy]

  def index
    @models = model_class.all
  end

  def new
    @model = model_class.new
  end

  def create
    @model = model_class.new(model_params)
    if @model.save
      flash[:success] = "#{model_class.model_name.human} criado com sucesso!"
      redirect_to url_for(model_class)
    else
      flash[:danger] = "Não foi possível criar o #{model_class.model_name.human}, veja os erros abaixo!"
      render :new
    end
  end

  def edit
  end

  def update
    if @model.update(model_params)
      flash[:success] = "#{model_class.model_name.human} alterado com sucesso!"
      redirect_to url_for(model_class)
    else
      flash[:danger] = "Não foi possível alterar o #{model_class.model_name.human}, veja os erros abaixo!"
      render :edit
    end
  end

  def destroy
    @model.destroy!
    flash[:success] = "#{model_class.model_name.human} excluído com sucesso!"
    redirect_to url_for(model_class)
  end

  private
    def find_model
      @model = model_class.find(params[:id])
    end
end
