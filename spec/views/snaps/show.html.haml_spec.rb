require 'spec_helper'

describe "snaps/show.html.haml" do
  before(:each) do
    @snap = assign(:snap, stub_model(Snap,
      :html => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
