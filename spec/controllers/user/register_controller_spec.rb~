require 'spec_helper'

describe User::RegisterController do

  describe "GET 'step1'" do
    it "should be successful" do
      get 'step1'
      response.should be_success
    end
  end

  describe "GET 'step2'" do
    it "should be redirect" do
      get 'step2'
      response.should be_redirect
    end
  end

  describe "GET 'step3'" do
    it "should be redirect" do
      get 'step3'
      response.should be_redirect
    end
  end

  describe "GET 'step4'" do
    it "should be successful" do
      get 'step4'
      response.should be_success
    end
  end

end
