require 'rails_helper'

RSpec.describe "Cards", type: :request do
  let(:valid_attributes) { { title: "Valid Card", description: "A valid card description" } }
  let(:invalid_attributes) { { title: "" } }
  let(:board){Board.create(title: "teste")}
  let(:list){List.create(title: "teste", position: 1, board_id: board.id) }
  describe "GET /cards/new" do
    it "renders a successful response" do
      get new_board_list_card_path(board_id: board.id, list_id: list.id)
      expect(response).to be_successful
    end
  end
end