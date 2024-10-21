require 'rails_helper'

RSpec.describe "/lists", type: :request do
  
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {skip("Add a hash of attributes invalid for your model")}
  let(:board){Board.create(title: "teste")}



  describe "GET /index" do
    it "renders a successful response" do
      List.create! valid_attributes
      get lists_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      list = List.create! valid_attributes
      get list_url(list)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_board_list_path(board_id: board.id)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      list = List.create! valid_attributes
      get edit_list_url(list)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested list" do
        list = List.create! valid_attributes
        patch list_url(list), params: { list: new_attributes }
        list.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the list" do
        list = List.create! valid_attributes
        patch list_url(list), params: { list: new_attributes }
        list.reload
        expect(response).to redirect_to(list_url(list))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        list = List.create! valid_attributes
        patch list_url(list), params: { list: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested list" do
      list = List.create! valid_attributes
      expect {
        delete list_url(list)
      }.to change(List, :count).by(-1)
    end

    it "redirects to the lists list" do
      list = List.create! valid_attributes
      delete list_url(list)
      expect(response).to redirect_to(lists_url)
    end
  end
end
