class ListsController < ApplicationController
  def index
    @lists = List.all
    @favorite_exists = Favorite.where(list: @list, user: current_user) != []
  end

  def favorite
    @lists = List.all
    @favorite_exists = Favorite.where(list: @list, user: current_user) != []
  end

  def show
    @list = List.find(params[:id])
    @favorite_exists = Favorite.where(list: @list, user: current_user) != []
  end

  def new
    @list = List.new
    @list.tasks.build
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      return redirect_to @list,
                         notice: 'Registrado com sucesso'
    end

    render :new
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :status, tasks_attributes: %i[id title])
  end
end
