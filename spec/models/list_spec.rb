# spec/models/list_spec.rb
require 'rails_helper'

RSpec.describe List, type: :model do
  describe "validations" do
    it "is valid with a title, position, and board" do
      board = Board.create(title: "Test Board")
      list = List.new(title: "My List", position: 1, board: board)
      expect(list).to be_valid
    end

    it "is invalid without a title" do
      list = List.new(title: nil)
      list.valid?
      expect(list.errors[:title]).to include("can't be blank")
    end

    it "is invalid without a position" do
      list = List.new(position: nil)
      list.valid?
      expect(list.errors[:position]).to include("can't be blank")
    end

    it "is invalid without a board" do
      list = List.new(board: nil)
      list.valid?
      expect(list.errors[:board]).to include("must exist")
    end
  end

  describe "associations" do
    it "belongs to a board" do
      association = List.reflect_on_association(:board)
      expect(association.macro).to eq(:belongs_to)
    end

    it "has many cards" do
      association = List.reflect_on_association(:cards)
      expect(association.macro).to eq(:has_many)
    end
  end

  describe "default scope" do
    it "orders by position in ascending order" do
      board = Board.create(title: "Test Board")
      list1 = List.create(title: "List 1", position: 2, board: board)
      list2 = List.create(title: "List 2", position: 1, board: board)
      expect(List.all).to eq([list2, list1])
    end
  end
end