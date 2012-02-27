#coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  def check_of_existence_administrator
    unless User.first
      Sex.create(:name => "мужской")
      Sex.create(:name => "женский")
      redirect_to :controller => "/user/register", :action => "step1"
    end
  end

  def check_for_administrating
    if session[:user_id] != 1
      redirect_to(:controller => '/pages/home', :action => 'index')
    end
  end
end
