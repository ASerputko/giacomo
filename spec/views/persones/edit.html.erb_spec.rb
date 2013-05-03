require 'spec_helper'

describe "persones/edit" do
  before(:each) do
    @persone = assign(:persone, stub_model(Persone,
      :first_name => "MyString",
      :last_name => "MyString",
      :status => "",
      :email => "MyString"
    ))
  end

  it "renders the edit persone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", persone_path(@persone), "post" do
      assert_select "input#persone_first_name[name=?]", "persone[first_name]"
      assert_select "input#persone_last_name[name=?]", "persone[last_name]"
      assert_select "input#persone_status[name=?]", "persone[status]"
      assert_select "input#persone_email[name=?]", "persone[email]"
    end
  end
end
