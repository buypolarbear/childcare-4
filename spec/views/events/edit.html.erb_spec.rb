require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :title => "MyString",
      :description => "MyString",
      :allDay => false,
      :url => "MyString",
      :color => "MyString",
      :textColor => "MyString",
      :child_id => 1,
      :type => ""
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_title[name=?]", "event[title]"
      assert_select "input#event_description[name=?]", "event[description]"
      assert_select "input#event_allDay[name=?]", "event[allDay]"
      assert_select "input#event_url[name=?]", "event[url]"
      assert_select "input#event_color[name=?]", "event[color]"
      assert_select "input#event_textColor[name=?]", "event[textColor]"
      assert_select "input#event_child_id[name=?]", "event[child_id]"
      assert_select "input#event_type[name=?]", "event[type]"
    end
  end
end
