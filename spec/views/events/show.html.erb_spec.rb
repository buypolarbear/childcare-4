require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :title => "Title",
      :description => "Description",
      :allDay => false,
      :url => "Url",
      :color => "Color",
      :textColor => "Text Color",
      :child_id => 1,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/false/)
    rendered.should match(/Url/)
    rendered.should match(/Color/)
    rendered.should match(/Text Color/)
    rendered.should match(/1/)
    rendered.should match(/Type/)
  end
end
