require 'spec_helper'

describe Tune do
  
  before(:each) do
    @tune = Factory(:tune)
  end
  
  it "adds a positive vote" do
    # We add a positive vote when creating the tune
    # We should not be able to upvote the tune any further
    expect{ @tune.add_karma_point(1) }.to_not change{ @tune.karma_sum }
  end
  
  it "adds a negative vote" do
    # We should now have a registered downvote
    expect{ @tune.add_karma_point(-1) }.to change{ @tune.karma_sum }.from(1).to(-1)
    # We shouldn't be able to execute multiple downvotes
    expect{ @tune.add_karma_point(-1) }.to_not change{ @tune.karma_sum }
  end
  
  it "filters by a handful of fields" do
    params = {'filter' => {}, 'order_by' => {}}
    Tune.search(params).all.should eq([@tune])
    
    params['filter'] = { 'cars_id' => @tune.car.id, 'cars_make' => @tune.car.make, 'cars_year' => @tune.car.year, 'track_id' => @tune.track_id, 'tune_type' => @tune.tune_type }
    Tune.search(params).all.should eq([@tune])
  end
  
  describe "orders a collection" do
    before(:each) do
      @params = {'filter' => {}, 'order_by' => {}}
      @tmp_tune = Factory(:tune)
    end
    
    after(:each) do
      Tune.search(@params).first.should eq(@tmp_tune)
      @params['order_by'].each_key {|key| @params['order_by'][key] = 'DESC' }
      Tune.search(@params).first.should eq(@tune)
    end
    
    it "by karma" do
      @params['order_by'] = {'karma' => 'ASC'}
      @tmp_tune.add_karma_point(-3)
    end
    
    it "by tune type" do
      @params['order_by'] = {'tune_type' => 'ASC'}
      @tmp_tune.update_attributes(:tune_type => 'Drag')
    end
    
    it "by car" do
      @params['order_by'] = {'car' => 'ASC'}
      @tmp_tune.update_attributes(:car => Factory(:car, :make => "Acura"))
    end
    
    it "by track name" do
      @params['order_by'] = {'track' => 'ASC'}
      @tmp_tune.update_attributes(:track => Factory(:track, :name => "Autowerks"))
    end
  end
  
end
