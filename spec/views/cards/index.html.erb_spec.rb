require 'rails_helper'

RSpec.describe "cards/index", type: :view do
  before(:each) do
    assign(:cards, [
      Card.create!(
        title: "Title",
        description: "MyText",
        position: 2,
        list: nil
      ),
      Card.create!(
        title: "Title",
        description: "MyText",
        position: 2,
        list: nil
      )
    ])
  end

  it "renders a list of cards" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end