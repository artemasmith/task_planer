class DepartmentsController < ApplicationController
  unloadable
  before_filter :find_department, only: [:show, :edit, :update, :destroy]

  def index
    @departments = Department.all
  end

  def create
    @department = Department.new
    @department[:id_group] = params[:department][:id_group]
    @department[:title] = params[:department][:title]
    @department.save
    respond_to do |format|
      format.html { redirect_to departments_path }
    end
  end

  def new
    @department = Department.new
  end

  def show
    @group = Group.find(@department[:id_group])
    @members = Group.find(@department[:id_group]).users.map{|m| m.name if m}.join(', ')
  end

  def edit
  end
  
  def update
    @department[:id_group] = params[:department][:id_group]
    @department[:title] = params[:department][:title]
    @department.save
    respond_to do |format|
      format.html { redirect_to departments_path }
    end
  end

  def destroy
    @department.delete
    respond_to do |format|
      format.html { redirect_to departments_path }
    end    
  end
  
  private
  
  def find_department
    @department = Department.find(params[:id])
  end
end
