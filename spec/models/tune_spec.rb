require 'spec_helper'

describe Tune do
  
  before(:each) do
    @tune = Factory(:tune)
  end
  
  it "adds a positive vote" do
    # We add a positive vote when creating the tune
    # We should not be able to upvote the tune any further
    expect{ @tune.add_karma_point(1) }.to_not change{ @tune.karma }
  end
  
  it "adds a negative vote" do
    # We should now have a registered downvote
    expect{ @tune.add_karma_point(-1) }.to change{ @tune.karma }.from(1).to(-1)
    # We shouldn't be able to execute multiple downvotes
    expect{ @tune.add_karma_point(-1) }.to_not change{ @tune.karma }
  end
  
  it "filters by a handful of fields" do
    params = {'filter' => {}}
    Tune.search(params).all.should eq([@tune])
  end
  
end
