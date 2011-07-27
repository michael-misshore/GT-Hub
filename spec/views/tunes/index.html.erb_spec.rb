require 'spec_helper'

describe "tunes/index.html.erb" do
  include Devise::TestHelpers
  
  before(:each) do
    @tuner = Factory.create(:tuner)
    sign_in @tuner
    
    assign(:tunes, [
      Factory(:tune),
      Factory(:tune)
    ])
    
    view.stub!(:params).and_return({'filter' => {'car' => {}}})
    assign(:car_makes, [])
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
