#coding: utf-8
require 'spec_helper'

describe Faculty do
  before(:each) do
    @attr = { :name => "ПМ" }
  end

  it "should create a new instance given valid attributes" do
    Faculty.create!(@attr)
  end
end
