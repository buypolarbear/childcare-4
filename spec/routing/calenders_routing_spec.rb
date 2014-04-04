require "spec_helper"

describe CalendersController do
  describe "routing" do

    it "routes to #index" do
      get("/calenders").should route_to("calenders#index")
    end

    it "routes to #new" do
      get("/calenders/new").should route_to("calenders#new")
    end

    it "routes to #show" do
      get("/calenders/1").should route_to("calenders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/calenders/1/edit").should route_to("calenders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/calenders").should route_to("calenders#create")
    end

    it "routes to #update" do
      put("/calenders/1").should route_to("calenders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/calenders/1").should route_to("calenders#destroy", :id => "1")
    end

  end
end
