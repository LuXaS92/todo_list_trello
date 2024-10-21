class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end

  def show
    @lists = @board.lists.includes(:cards)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to @board, notice: 'Board criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: 'Board atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_url, notice: 'Board excluído com sucesso.'
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title)
  end
end