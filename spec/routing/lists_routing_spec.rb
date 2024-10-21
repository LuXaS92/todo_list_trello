# spec/routing/lists_routing_spec.rb
require "rails_helper"

RSpec.describe ListsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/boards/1/lists").to route_to("lists#index", board_id: "1")
    end

    it "routes to #new" do
      expect(get: "/boards/1/lists/new").to route_to("lists#new", board_id: "1")
    end

    it "routes to #show" do
      expect(get: "/boards/1/lists/1").to route_to("lists#show", board_id: "1", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/boards/1/lists/1/edit").to route_to("lists#edit", board_id: "1", id: "1")
    end

    it "routes to #create" do
      expect(post: "/boards/1/lists").to route_to("lists#create", board_id: "1")
    end

    it "routes to #update via PUT" do
      expect(put: "/boards/1/lists/1").to route_to("lists#update", board_id: "1", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/boards/1/lists/1").to route_to("lists#update", board_id: "1", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/boards/1/lists/1").to route_to("lists#destroy", board_id: "1", id: "1")
    end
  end
end