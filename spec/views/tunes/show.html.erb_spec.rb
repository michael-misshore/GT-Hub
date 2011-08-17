require 'spec_helper'

describe "tunes/show.html.erb" do
  include Devise::TestHelpers
  
  before(:each) do
    @tuner = Factory(:tuner)
    sign_in @tuner
    
    @tune = assign(:tune, Factory(:tune))
    @tune.stub(:karma).and_return("1")
    
    @groups = {}
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
