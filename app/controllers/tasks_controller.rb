class TasksController < ApplicationController
  unloadable
  before_filter :find_plan
  
  def create
    fields = [:id_user,:id_plan,:task,:plan_finish_timen,:finish_time,:aquaiant_time,:status]
    @task = @plan.tasks.new
    fields.each {|f| @task[f]=params[f]}
    @task.save
    respond_to do |format|
      format.html
      format.json {@task}
    end
  end
  
  def show
    @task = Task.find(params[:id])
    attributes = @task.attributes
    
    render json: attributes
  end
  
  def destroy
  
  end
  
  private
    def find_plan
#      id = params[:
      @plan = Plan.find(params[:id_plan])
    end
  

end
