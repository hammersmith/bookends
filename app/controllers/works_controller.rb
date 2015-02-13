class WorksController < ApplicationController
  
  before_filter :find_work, only: [:show, :update, :destroy]

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      render nothing: true, status: :not_acceptable
    end
  end
  
  def show
  end
  
  def update
    @work.update_attributes(work_params)
    if @work.save
      render nothing: true
    else
      render nothing: true, status: :not_acceptable
    end
  end
  
  def destroy
    @work.destroy
    render nothing: true
  end
  
  private
  
  def find_work
    @work = Work.find(params[:id])
  end
  
  def work_params
    parameters = params.require(:work).permit(:title, :author, :media_format, :publisher, :published_on, :description)
    parameters[:media_format] = parameters[:media_format].try(:titleize)
    parameters
  end
  
end
