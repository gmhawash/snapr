require "spec_helper"

describe SnapsController do
  describe "routing" do

    it "routes to #index" do
      get("/snaps").should route_to("snaps#index")
    end

    it "routes to #new" do
      get("/snaps/new").should route_to("snaps#new")
    end

    it "routes to #show" do
      get("/snaps/1").should route_to("snaps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/snaps/1/edit").should route_to("snaps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/snaps").should route_to("snaps#create")
    end

    it "routes to #update" do
      put("/snaps/1").should route_to("snaps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/snaps/1").should route_to("snaps#destroy", :id => "1")
    end

  end
end
