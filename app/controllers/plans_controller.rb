class PlansController < ApplicationController
  unloadable
  require 'will_paginate/array'
  before_filter :find_project


  def index
    @plans = Plan.all.paginate(page: params[:page], per_page: 15)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = Plan.new
    attributes = [:id_owner, :id_performer, :id_department, :scan]
    attributes.each { |a| @plan[a]=params[:plan][a] }
    @plan.save
    if !@plan.errors.blank?
	@plan.error.each { |e| flash[:error]+=e.to_s }
    end
    respond_to do |format|
	format.html { redirect_to plans_path(project_id: params[:plan][:project_id]) }
	format.json { render json: @plan.attributes }
    end
  end

  def new
    @plan = Plan.new
  end

  def edit
    @plan = Plan.find(params[:id])
  end
  
  def update
   @plan = Plan.find(params[:id])
   flash[:error] = 'no plan' if !@plan
   attr = [:id_performer, :id_department, :scan, :id_owner]
   attr.each do |a|
     @plan[a]=params[:plan][a]
   end
   @plan.save
   flash[:error] = @plan.errors.messages.map { |e| e.to_s}.join(',') if !@plan.errors.blank?
   respond_to do |format|
     format.html { redirect_to plans_path(project_id: params[:plan][:project_id]) }
     format.json { render json: @plan }
   end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.delete if plan
    respond_to do |format|
      format.js
      format.html { redirect_to plans_path(project_id: params[:project_id]) }
      format.json { render json: plan }
    end
  end
  
  private
  
  def find_project
    if params[:plan]
      id = params[:plan][:project_id]
    else
      id = params[:project_id]
    end
    @project = Project.find_by_identifier(id)
    @project
  end
end
