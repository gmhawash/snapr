require 'spec_helper'

describe "snaps/index.html.haml" do
  before(:each) do
    assign(:snaps, [
      stub_model(Snap,
        :html => "MyText"
      ),
      stub_model(Snap,
        :html => "MyText"
      )
    ])
  end

  it "renders a list of snaps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
