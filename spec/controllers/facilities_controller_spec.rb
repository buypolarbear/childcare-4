require 'spec_helper'

describe FacilitiesController do

  describe "GET 'settings'" do
    it "returns http success" do
      get 'settings'
      response.should be_success
    end
  end

  describe "GET 'timespace'" do
    it "returns http success" do
      get 'timespace'
      response.should be_success
    end
  end

end
