require 'rails_helper'

RSpec.describe "cards/edit", type: :view do
  let(:card) {
    Card.create!(
      title: "MyString",
      description: "MyText",
      position: 1,
      list: nil
    )
  }

  before(:each) do
    assign(:card, card)
  end

  it "renders the edit card form" do
    render

    assert_select "form[action=?][method=?]", card_path(card), "post" do

      assert_select "input[name=?]", "card[title]"

      assert_select "textarea[name=?]", "card[description]"

      assert_select "input[name=?]", "card[position]"

      assert_select "input[name=?]", "card[list_id]"
    end
  end
end
