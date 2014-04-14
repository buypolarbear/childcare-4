require 'spec_helper'

describe ReportsController do

  describe "GET 'test_action'" do
    it "returns http success" do
      get 'test_action'
      response.should be_success
    end
  end

end
