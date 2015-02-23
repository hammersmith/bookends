class WorksController < ApplicationController
  
  before_filter :find_work, only: [:show, :update, :destroy]

  def index
    @search_form = SearchForm.new
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to work_path(@work)
    else
      render 'create', status: :not_acceptable
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

  def search
    searcher = WorkSearch.new(works_search_params)
    @works = searcher.results
  end
  
  private
  
  def find_work
    @work = Work.find(params[:id])
  end

  def works_search_params
    params.require(:works_search).permit(:contains, :type, :title, :author, :available, :identifiers)
  end
  
  def work_params
    parameters = params.require(:work).permit(:title, :author, :media_format, :publisher, :published_on, :description, :location_id)
    if parameters[:media_format]
      parameters[:media_format] = parameters[:media_format].titleize
    end
    parameters
  end
  
end
