class Plan < ActiveRecord::Base
  unloadable
  validates :id_owner, presence: true
  validates :id_performer, presence: true
  
  belongs_to :department
  belongs_to :owner, class_name: 'User', foreign_key: :id_owner
  belongs_to :performer, class_name: 'User', foreign_key: :id_performer
  has_many :reports,class_name: 'Report', foreign_key: :id_plan
  has_many :tasks, class_name: 'Task', foreign_key: :id_plan
  
  def set_date()
    
  end
end
