class Plan < ActiveRecord::Base
  unloadable
  validates :id_owner, presence: true
  validates :id_performer, presence: true
  
  belongs_to :department
  belongs_to :owner, class_name: 'user', foreign_key: :id_owner
  belongs_to :performer, class_name: 'user', foreign_key: :id_performer
  has_many :report
  has_many :task
end
