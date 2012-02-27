class Chair < ActiveRecord::Base
  belongs_to :faculty

  validates :name, :presence => true,
                   :length => { :maximum => 50 }
end
