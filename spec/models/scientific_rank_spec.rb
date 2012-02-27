#coding: utf-8
require 'spec_helper'

describe ScientificRank do
  before(:each) do
    @attr = { :name => "профессор" }
  end

  it "should create a new instance given valid attributes" do
    ScientificRank.create!(@attr)
  end
end
