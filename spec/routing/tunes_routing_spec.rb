require "spec_helper"

describe TunesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/tunes" }.should route_to(:controller => "tunes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tunes/new" }.should route_to(:controller => "tunes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tunes/1" }.should route_to(:controller => "tunes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tunes/1/edit" }.should route_to(:controller => "tunes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tunes" }.should route_to(:controller => "tunes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/tunes/1" }.should route_to(:controller => "tunes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tunes/1" }.should route_to(:controller => "tunes", :action => "destroy", :id => "1")
    end

  end
end
