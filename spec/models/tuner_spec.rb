require 'spec_helper'

describe Tuner do
    
  context "karma points" do
    let(:tuner) { Factory(:tuner) }
    let(:tune) { Factory(:tune, :tuner => tuner) }
    
    before(:each) do
      tune.save
    end
    
    it "should add one (1) total karma point upon tune creation" do 
      # Because the tune is saved and created by our tuner
      tuner.total_karma.to_i.should eq(1)
    end
    
    it "should remove karma points belonging to a tune when destroyed" do 
      expect{ tune.destroy }.to change{ tuner.total_karma.to_i }.from(1).to(0)
    end
  end  
end