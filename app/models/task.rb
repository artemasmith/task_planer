class Task < ActiveRecord::Base
  unloadable
  validates :task, presence: true
  validates :id_user, presence: true
  validates :id_plan, presence: true
  
  belongs_to :plan
  belongs_to :user
end
