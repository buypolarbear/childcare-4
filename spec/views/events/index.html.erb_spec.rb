require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :title => "Title",
        :description => "Description",
        :allDay => false,
        :url => "Url",
        :color => "Color",
        :textColor => "Text Color",
        :child_id => 1,
        :type => "Type"
      ),
      stub_model(Event,
        :title => "Title",
        :description => "Description",
        :allDay => false,
        :url => "Url",
        :color => "Color",
        :textColor => "Text Color",
        :child_id => 1,
        :type => "Type"
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Text Color".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
