require 'spec_helper'

describe "calenders/show" do
  before(:each) do
    @calender = assign(:calender, stub_model(Calender))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
