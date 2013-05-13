require 'spec_helper'

describe Sdn do
	before { @sdn = Sdn.new(uid: 1, first_name: "Andrew", last_name: "Serputko") }

	subject { @sdn }

	it { should respond_to(:uid) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }

  it { should be_valid }

  describe "uid is required" do
  	before { @sdn.uid = nil }
  	it { should_not be_valid }
  end

  describe "uid should be unique" do
  	before do
      sdn_with_same_uid = @sdn.dup
      sdn_with_same_uid.save
    end

    it { should_not be_valid }
  end

  describe "last_name is required" do
  	before { @sdn.last_name = " " }
  	it { should_not be_valid }
  end
end

