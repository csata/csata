require 'spec_helper'

describe Pages::HomeController do

  describe "GET 'index'" do
    it "should be redirect" do
      get 'index'
      response.should be_redirect
    end
  end

end