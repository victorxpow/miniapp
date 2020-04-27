class ListsController < ActionController::Base
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params) 
    @list.user = current_user
    return redirect_to @list,
            notice: 'Registrado com sucesso'if @list.save

    render :new

  end

  private

  def list_params
      params.require(:list).permit(:name, :description, :status)
  end

end
