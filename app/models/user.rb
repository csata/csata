#coding: utf-8
class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  belongs_to :chair
  belongs_to :sex
  belongs_to :military_rank
  belongs_to :scientific_rank
  belongs_to :post
  has_many :logs

  validates :email, :presence => true, 
                    :uniqueness => true, 
                    :length => { :maximum => 30 }, 
                    :format => { :with =>  /^([a-z0-9_\-]+\.)*[a-z0-9_\-]+\@([a-z0-9][a-z0-9\-]*[a-z0-9]\.)+[a-z]{2,4}$/i }

  validates :password, :presence => true, 
                       :length => { :maximum => 30, :minimum => 5 }, 
                       :confirmation => true, 
                       :format => { :with =>  /^([a-z0-9])+$/i }

  validates :last_name, :presence => true,
                        :length => { :maximum => 30 }, 
                        :format => { :with =>  /^([а-я])+$/i }

  validates :first_name, :presence => true,
                         :length => { :maximum => 30 }, 
                         :format => { :with =>  /^([а-я])+$/i }

  validates :middle_name, :presence => true,
                          :length => { :maximum => 30 }, 
                          :format => { :with =>  /^([а-я])+$/i }
  
  validates :phone, :format => { :with => /^([\+]?[0-9]{11})?$/i }
  

  private
  def self.authenticate(email, password)
    user = self.where(:email => email, :password => password).first
  end

end