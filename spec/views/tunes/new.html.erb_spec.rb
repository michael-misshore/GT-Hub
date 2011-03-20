require 'spec_helper'

describe "tunes/new.html.erb" do
  before(:each) do
    assign(:tune, stub_model(Tune,
      :car_id => 1,
      :user_id => 1,
      :track_id => 1
    ).as_new_record)
  end

  it "renders new tune form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tunes_path, :method => "post" do
      assert_select "input#tune_car_id", :name => "tune[car_id]"
      assert_select "input#tune_user_id", :name => "tune[user_id]"
      assert_select "input#tune_track_id", :name => "tune[track_id]"
    end
  end
end
