require 'spec_helper'

describe "tunes/index.html.erb" do
  before(:each) do
    assign(:tunes, [
      Factory(:tune),
      Factory(:tune)
    ])
  end

  it "renders a list of tunes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td"
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td"
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td"
  end
end
