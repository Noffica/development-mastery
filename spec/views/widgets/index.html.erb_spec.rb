require 'rails_helper'

RSpec.describe "widgets/index", type: :view do
  before(:each) do
    assign(:widgets, [
      Widget.create!(
        name: "Name"
      ),
      Widget.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of widgets" do
    pending "to do?"
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
