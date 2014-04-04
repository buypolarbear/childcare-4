require 'spec_helper'

describe "calenders/new" do
  before(:each) do
    assign(:calender, stub_model(Calender).as_new_record)
  end

  it "renders new calender form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", calenders_path, "post" do
    end
  end
end
