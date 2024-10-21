require 'rails_helper'

RSpec.describe "lists/show", type: :view do
  before(:each) do
    assign(:list, List.create!(
      title: "Title",
      position: 2,
      board: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
