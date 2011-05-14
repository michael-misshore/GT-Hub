require 'spec_helper'

describe "tunes/edit.html.erb" do
  include Devise::TestHelpers
  
  before(:each) do
    @tuner = Factory(:tuner)
    sign_in @tuner
    @tune = Factory(:tune)
  end

  it "renders the edit tune form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tunes_path(@tune), :method => "post" do
      assert_select "#tune_car_id", :name => "tune[car_id]"
      assert_select "#tune_tuner_id", :name => "tune[tuner_id]"
      assert_select "#tune_track_id", :name => "tune[track_id]"
    end
  end
end
