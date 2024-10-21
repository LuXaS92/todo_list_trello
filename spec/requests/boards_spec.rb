require 'rails_helper'

RSpec.describe "/boards", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Board.create! valid_attributes
      get boards_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      board = Board.create! valid_attributes
      get board_url(board)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_board_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      board = Board.create! valid_attributes
      get edit_board_url(board)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested board" do
        board = Board.create! valid_attributes
        patch board_url(board), params: { board: new_attributes }
        board.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the board" do
        board = Board.create! valid_attributes
        patch board_url(board), params: { board: new_attributes }
        board.reload
        expect(response).to redirect_to(board_url(board))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        board = Board.create! valid_attributes
        patch board_url(board), params: { board: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested board" do
      board = Board.create! valid_attributes
      expect {
        delete board_url(board)
      }.to change(Board, :count).by(-1)
    end

    it "redirects to the boards list" do
      board = Board.create! valid_attributes
      delete board_url(board)
      expect(response).to redirect_to(boards_url)
    end
  end
end
