require "spec_helper"

describe PersonesController do
  describe "routing" do

    it "routes to #index" do
      get("/persones").should route_to("persones#index")
    end

    it "routes to #new" do
      get("/persones/new").should route_to("persones#new")
    end

    it "routes to #show" do
      get("/persones/1").should route_to("persones#show", :id => "1")
    end

    it "routes to #edit" do
      get("/persones/1/edit").should route_to("persones#edit", :id => "1")
    end

    it "routes to #create" do
      post("/persones").should route_to("persones#create")
    end

    it "routes to #update" do
      put("/persones/1").should route_to("persones#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/persones/1").should route_to("persones#destroy", :id => "1")
    end

  end
end
