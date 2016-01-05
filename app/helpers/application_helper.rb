module ApplicationHelper
  def show_link(object)
    link_to 'Detalhes', object
  end

  def delete_link(object)
    link_to 'Excluir', object, method: :delete, data: {
      confirm: "A exclusão de um #{model_name(object)} é irreversível! Você tem certeza que deseja excluir o #{model_name(object)} '#{object.name}'?"
    }
  end

  private
    def model_name(object)
      object.class.model_name.human.downcase
    end
end
