require 'spec_helper'

describe "persones/show" do
  before(:each) do
    @persone = assign(:persone, stub_model(Persone,
      :first_name => "First Name",
      :last_name => "Last Name",
      :status => "",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(//)
    rendered.should match(/Email/)
  end
end
