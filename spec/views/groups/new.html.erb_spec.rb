require 'spec_helper'

describe "groups/new.html.erb" do
  include Devise::TestHelpers
  
  before(:each) do
    @tuner = Factory.create(:tuner)
    sign_in @tuner
    
    assign(:group, Factory(:group))
  end

  it "renders new group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => groups_path, :method => "post" do
      assert_select "#group_name", :name => "group[name]"
      assert_select "#group_message", :name => "group[message]"
      # assert_select "#group_admin", :name => "group[admin]"
      assert_select "#group_private", :name => "group[private]"
    end
  end
end
