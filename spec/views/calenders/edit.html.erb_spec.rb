require 'spec_helper'

describe "calenders/edit" do
  before(:each) do
    @calender = assign(:calender, stub_model(Calender))
  end

  it "renders the edit calender form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", calender_path(@calender), "post" do
    end
  end
end
