#coding: utf-8
require 'spec_helper'

describe Log do
  before(:each) do
    @attr = { :content => "текст" }
  end

  it "should create a new instance given valid attributes" do
    Log.create!(@attr)
  end
end
