require 'spec_helper'

describe "tunes/new.html.erb" do
  include Devise::TestHelpers
  
  before(:each) do
    @user = Factory.create(:user)
    sign_in @user
    
    assign(:tune, Factory(:tune))
  end

  it "renders new tune form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tunes_path, :method => "post" do
      assert_select "#tune_car_id", :name => "tune[car_id]"
      assert_select "#tune_user_id", :name => "tune[user_id]"
      assert_select "#tune_track_id", :name => "tune[track_id]"
    end
  end
end
