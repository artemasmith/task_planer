class PlansController < ApplicationController
  unloadable
  
  before_filter :find_plan, only: [:show, :edit, :destroy, :create]


  def index
    @plans = Plan.all.paginate(page: params[:page], per_page: 15)
  end

  def show
  end

  def create
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
