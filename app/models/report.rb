class Report < ActiveRecord::Base
  unloadable
  belongs_to :plan
end
