class Plan < ActiveRecord::Base
  unloadable
  validates :id_owner, presence: true
  validates :id_performer, presence: true
end
