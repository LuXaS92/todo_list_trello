# spec/routing/cards_routing_spec.rb
require "rails_helper"

RSpec.describe CardsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/boards/1/lists/1/cards").to route_to("cards#index", board_id: "1", list_id: "1")
    end

    it "routes to #new" do
      expect(get: "/boards/1/lists/1/cards/new").to route_to("cards#new", board_id: "1", list_id: "1")
    end

    it "routes to #show" do
      expect(get: "/boards/1/lists/1/cards/1").to route_to("cards#show", board_id: "1", list_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/boards/1/lists/1/cards/1/edit").to route_to("cards#edit", board_id: "1", list_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/boards/1/lists/1/cards").to route_to("cards#create", board_id: "1", list_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/boards/1/lists/1/cards/1").to route_to("cards#update", board_id: "1", list_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/boards/1/lists/1/cards/1").to route_to("cards#update", board_id: "1", list_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/boards/1/lists/1/cards/1").to route_to("cards#destroy", board_id: "1", list_id: "1", id: "1")
    end
  end
end