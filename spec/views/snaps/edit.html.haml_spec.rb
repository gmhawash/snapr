require 'spec_helper'

describe "snaps/edit.html.haml" do
  before(:each) do
    @snap = assign(:snap, stub_model(Snap,
      :html => "MyText"
    ))
  end

  it "renders the edit snap form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => snaps_path(@snap), :method => "post" do
      assert_select "textarea#snap_html", :name => "snap[html]"
    end
  end
end
