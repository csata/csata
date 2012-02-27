class Pages::AdminController < ApplicationController
  before_filter :check_of_existence_administrator
  def index
  end
end
