require 'rails_helper'

RSpec.describe Card, type: :model do
  let(:list) { List.create(title: "Test List", position: 1) }
  
  describe "validations" do
    it "is valid with valid attributes" do
      card = Card.new(title: "Test Card", description: "This is a test card", position: 1, list: list)
      expect(card).to be_valid
    end

    it "is not valid without a title" do
      card = Card.new(description: "This is a test card", position: 1, list: list)
      expect(card).to_not be_valid
    end

    it "is not valid without a position" do
      card = Card.new(title: "Test Card", description: "This is a test card", list: list)
      expect(card).to_not be_valid
    end

    it "is not valid without a list" do
      card = Card.new(title: "Test Card", description: "This is a test card", position: 1)
      expect(card).to_not be_valid
    end
  end

  describe "associations" do
    it "belongs to a list" do
      association = described_class.reflect_on_association(:list)
      expect(association.macro).to eq :belongs_to
    end
  end
end