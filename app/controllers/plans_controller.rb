class PlansController < ApplicationController
  unloadable
  require 'will_paginate/array'
  before_filter :find_plan, only: [:show, :edit, :destroy, :create]


  def index
    @plans = Plan.all.paginate(page: params[:page], per_page: 15)
  end

  def show
  end

  def create
    @plan = Plan.new
    attributes = [:id_owner, :id_performer, :id_department, :scan]
    attributes.each {|a| @plan[a]=params[a]}
    @plan.save
    
    respond_to do |format|
	format.html {redirect plans_path(project_id: params[:project_id])}
	format.json {render @plan}
    end
#    render json: @plan
  end

  def new
  end

  def edit
  end

  def destroy
  end
  
  private
  
  def find_plan
    id = params[:id]
    id = params[:id_plan] if id.blank?
    @plan ||= Plan.find(id)
  end
end
