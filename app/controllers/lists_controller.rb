class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def create
    @list = @board.lists.new(list_params)
    @list.position = @board.lists.count + 1
    if @list.save
      redirect_to @board, notice: 'Lista criada com sucesso.'
    else
      redirect_to @board, alert: 'Erro ao criar lista.'
    end
  end

  def new
    @board = Board.find(params[:board_id])
    @list = @board.lists.new
  end

  def update
    if @list.update(list_params)
      redirect_to @board, notice: 'Lista atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to @board, notice: 'Lista excluída com sucesso.'
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = @board.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :position)
  end
end