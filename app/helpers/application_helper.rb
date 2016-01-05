module ApplicationHelper
  def show_link(object)
    link_to 'Detalhes', object
  end

  def delete_link(object)
    link_to 'Excluir', object, method: :delete, data: {
      confirm: "A exclusão de um #{model_name(object)} é irreversível! Você tem certeza que deseja excluir o #{model_name(object)} '#{object.name}'? As matrículas relacionadas serão apagadas."
    }
  end

  def back_button(klass)
    link_to 'Voltar', klass, class: 'btn btn-default'
  end

  private
    def model_name(object)
      object.class.model_name.human.downcase
    end
end
