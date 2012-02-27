#coding: utf-8
require 'spec_helper'

describe MilitaryRank do
  before(:each) do
    @attr = { :name => "полковник" }
  end

  it "should create a new instance given valid attributes" do
    MilitaryRank.create!(@attr)
  end
end
