class CardsController < ApplicationController
  before_action :set_list
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def create
    @card = @list.cards.new(card_params)
    @card.position = @list.cards.count + 1
    if @card.save
      redirect_to @list.board, notice: 'Card criado com sucesso.'
    else
      redirect_to @list.board, alert: 'Erro ao criar card.'
    end
  end

  def new
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:list_id])
    @card = @list.cards.new
  end

  def edit
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:list_id])
    @card = @list.cards.find(params[:id])
  end
  

  def update
    if @card.update(card_params)
      redirect_to @list.board, notice: 'Card atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to @list.board, notice: 'Card excluído com sucesso.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_card
    @card = @list.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :description, :position)
  end
end