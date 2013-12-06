class PlansController < ApplicationController
  unloadable
  require 'will_paginate/array'
  before_filter :find_project


  def index
    @plans = Plan.all.paginate(page: params[:page], per_page: 15)
  end

  def show
  end

  def create
    @plan = Plan.new
    attributes = [:id_owner, :id_performer, :id_department, :scan]
    attributes.each {|a| @plan[a]=params[:plan][a]}
    @plan.save
    if !@plan.errors.blank?
	@plan.error.each {|e| flash[:error]+=e.to_s }
    end
    respond_to do |format|
	format.html {redirect_to plans_path(project_id: params[:plan][:project_id])}
	format.json {render json: @plan.attributes}
    end
  end

  def new
    @plan = Plan.new
  end

  def edit
  end

  def destroy
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
