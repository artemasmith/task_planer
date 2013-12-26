class Task < ActiveRecord::Base
  unloadable
  validates :task, presence: true
  validates :id_user, presence: true, numericality: true
  validates :id_plan, presence: true, numericality: true
  
  belongs_to :plan
  belongs_to :user, foreign_key: :id_user
  
  #attr{name: finish_time|plan_finish_time|aq, value:'2013-12-31'|Time.now, type: [:str|date]}
  def set_time(attr)
    date = attr[:value]
    if attr[:type] && attr[:type] == :str
      time = attr[:value].split('-')
      begin
        date = Time.new(time[0], time[1], time[2])
      rescue
        logger.warn('time is not correct')
        return false
      end
    end
    self[attr[:name]] = date
    self.save
  end
end
