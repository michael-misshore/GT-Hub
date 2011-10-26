require 'spec_helper'

describe Tuner do
    
  context "karma points" do
    
    before(:each) do
      @tune = Factory(:tune)
      @tuner = Tuner.find(@tune.tuner_id)
      @tune.save
    end
    
    it "should add one (1) total karma point upon tune creation" do 
      # Because the tune is saved and created by our tuner
      @tuner.total_karma.should == 1
    end
    
    it "should remove karma points belonging to a tune when destroyed" do 
      expect{ @tune.destroy }.to change{ @tuner.total_karma }.from(1).to(0)
    end
  end  
end