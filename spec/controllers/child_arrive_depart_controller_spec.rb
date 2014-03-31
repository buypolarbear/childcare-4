require 'spec_helper'

describe ChildArriveDepartController do

  describe "GET 'last_names'" do
    it "returns http success" do
      get 'last_names'
      response.should be_success
    end
  end

  describe "GET 'children'" do
    it "returns http success" do
      get 'children'
      response.should be_success
    end
  end

  describe "GET 'parents'" do
    it "returns http success" do
      get 'parents'
      response.should be_success
    end
  end

end
