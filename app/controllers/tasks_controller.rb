class TasksController < ApplicationController
  unloadable
  before_filter :find_plan
  
  def create
    fields = [:id_user,:id_plan,:task, :status]
    @task = Task.new
    fields.each { |f| @task[f]=params[:task][f] }
    #time calculation
    @task.plan_finish_time = Date.new(params[:task]['plan_finish_time(1i)'].to_i, params[:task]['plan_finish_time(2i)'].to_i, params[:task]['plan_finish_time(3i)'].to_i)
    @task.save
    respond_to do |format|
      format.html { redirect_to plan_path(id: params[:task][:id_plan], project_id: params[:task][:project_id]) }
      format.js {}
      #{render 'plans/task_list', plan: Plan.find(params[:task][:id_plan])}
    end
  end
  
  def show
    @task = Task.find(params[:id])
    attributes = @task.attributes
    
    render json: attributes
  end
  
  def update
    @task = Task.find(params[:id])
    fields = [:id_user,:id_plan,:task, :status]
    fields.each {|f| @task[f]=params[:task][f] }
    error = false
    error ||= set_if_false(@task.set_time({ value: params[:task]['plan_finish_time(1i)'] + '-' +  params[:task]['plan_finish_time(2i)'] + '-' + params[:task]['plan_finish_time(3i)'], name: :plan_finish_time, type: :str }))
    error ||= set_if_false(@task.set_time({ value: params[:task][:finish_time], name: :finish_time })) if params[:task][:finish_time]
    error ||= set_if_false(@task.set_time({ value: Date.new(params[:task]['finish_time(1i)'] + '-' + params[:task]['finish_time(2i)'] + '-' + params[:task]['finish_time(3i)'], name: :finish_time, type: :str))
    error ||= set_if_false(@task.set_time({ value: params[:task][:aquaiant_time], name: :aquaiant_time })) if params[:task][:aquaiant_time]
    error ||= set_if_false(@task.set_time({ value: Date.new(params[:task]['aquaiant_time(1i)'] + '-' + params[:task]['aquaiant_time(2i)'] + '-' + params[:task]['aquaiant_time(3i)'], name: :aquaiant_time, type: :str }))
      
#    flash[:error] = t :wrong_date if error
    @task.save
    respond_to do |format|
      format.html { redirect_to plan_path(id: params[:task][:id_plan], project_id: params[:project_id])  }
      format.js {}
    end
    
  end
  
  def destroy
    task = Task.find(params[:id]).delete
    respond_to do |format|
      format.html { redirect_to plan_path(id: params[:id_plan], project_id: params[:project_id]) }
      format.js
    end
  end
  
  private
    def find_plan
      id = params[:id_plan]
      id ||= params[:task][:id_plan]
      @plan = Plan.find(id)
    end
  

end
