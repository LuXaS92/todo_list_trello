# spec/models/board_spec.rb
require 'rails_helper'

RSpec.describe Board, type: :model do
  describe "validations" do
    it "is valid with a title" do
      board = Board.new(title: "My Board")
      expect(board).to be_valid
    end

    it "is invalid without a title" do
      board = Board.new(title: nil)
      board.valid?
      expect(board.errors[:title]).to include("can't be blank")
    end
  end

  describe "associations" do
    it "has many lists" do
      association = Board.reflect_on_association(:lists)
      expect(association.macro).to eq(:has_many)
    end

    it "has many cards through lists" do
      association = Board.reflect_on_association(:cards)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:lists)
    end
  end
end