require 'rails_helper'

RSpec.describe "cards/show", type: :view do
  before(:each) do
    assign(:card, Card.create!(
      title: "Title",
      description: "MyText",
      position: 2,
      list: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
