class Pattern < ActiveRecord::Base
  unloadable
  belongs_to :department
end
