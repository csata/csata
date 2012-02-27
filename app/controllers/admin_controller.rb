class AdminController < ApplicationController
  before_filter :check_for_administrating
end
