require 'spec_helper'

describe "persones/index" do
  before(:each) do
    assign(:persones, [
      stub_model(Persone,
        :first_name => "First Name",
        :last_name => "Last Name",
        :status => "",
        :email => "Email"
      ),
      stub_model(Persone,
        :first_name => "First Name",
        :last_name => "Last Name",
        :status => "",
        :email => "Email"
      )
    ])
  end

  it "renders a list of persones" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
