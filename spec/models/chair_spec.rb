require 'spec_helper'

describe Chair do
  before(:each) do
    @attr = { :name => "731" }
  end

  it "should create a new instance given valid attributes" do
    Chair.create!(@attr)
  end
end
