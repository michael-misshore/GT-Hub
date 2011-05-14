require 'spec_helper'

describe "tunes/show.html.erb" do
  include Devise::TestHelpers
  
  before(:each) do
    @tuner = Factory(:tuner)
    sign_in @tuner
    
    @tune = assign(:tune, stub_model(Tune,
      :car_id => 1,
      :tuner_id => 1,
      :track_id => 1
    ))
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
