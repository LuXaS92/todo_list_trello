require 'rails_helper'

RSpec.describe "lists/edit", type: :view do
  let(:list) {
    List.create!(
      title: "MyString",
      position: 1,
      board: nil
    )
  }

  before(:each) do
    assign(:list, list)
  end

  it "renders the edit list form" do
    render

    assert_select "form[action=?][method=?]", list_path(list), "post" do

      assert_select "input[name=?]", "list[title]"

      assert_select "input[name=?]", "list[position]"

      assert_select "input[name=?]", "list[board_id]"
    end
  end
end
