class Department < ActiveRecord::Base
  unloadable
  
  has_many :pattern
  belongs_to :group
  has_one :plan
end
