require 'spec_helper'

describe "snaps/new.html.haml" do
  before(:each) do
    assign(:snap, stub_model(Snap,
      :html => "MyText"
    ).as_new_record)
  end

  it "renders new snap form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => snaps_path, :method => "post" do
      assert_select "textarea#snap_html", :name => "snap[html]"
    end
  end
end
