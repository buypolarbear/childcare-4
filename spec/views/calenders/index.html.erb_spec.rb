require 'spec_helper'

describe "calenders/index" do
  before(:each) do
    assign(:calenders, [
      stub_model(Calender),
      stub_model(Calender)
    ])
  end

  it "renders a list of calenders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
