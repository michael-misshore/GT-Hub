require 'spec_helper'

describe Tune do
  
  it "should add one (1) karam point upon tune creation by the creator" do 
    # We shouldn't have any karma before saving
    tune = Factory.build(:tune)
    tune.karma.should eq(0)
    tune.karma_points.empty?.should be_true
    # We now should have a karma of 1
    tune.save
    tune.karma.should eq(1)
    tune.karma_points.size.should eq(1)
  end
  
  it "adds a positive vote" do
    # We add a positive vote by creating the tune
    tune = Factory(:tune)
    tune.karma.should eq(1)
    # We should not be able to upvote the tune any further
    tune.add_karma_point(1)
    tune.karma.should eq(1)
  end
  
  it "adds a negative vote" do
    tune = Factory(:tune)
    # We should now have a registered downvote
    tune.add_karma_point(-1)
    tune.karma.should eq(-1)
  end
  
end
