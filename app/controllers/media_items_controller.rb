class MediaItemsController < ApplicationController
  
  before_filter :find_work, only: [:show, :update, :destroy]

  def create
    work = MediaItem.new(work_params)
    if work.save
      render json: { 
        remoteId: work.remote_id,
        form: render_to_string(partial: 'update_form', locals: { work: work })
      }
    else
      render nothing: true, status: :not_acceptable
    end
  end
  
  def show
  end
  
  def update
    @work.quantity = params[:work][:quantity]
    if @work.save
      render nothing: true
    else
      render nothing: true, status: :not_acceptable
    end
  end
  
  def destroy
    @work.destroy
    render json: { remoteId: @work.remote_id }
  end
  
  def check_inventory
    inventory = MediaItem.where(remote_id: params[:gbIds]).select(:id, :quantity, :remote_id).each_with_object({}) do |item, hash|
      hash[item.remote_id] = render_to_string(partial: 'update_form', locals: { work: item })
    end
    
    render json: inventory
  end
  
  private
  
  def find_work
    @work = MediaItem.find(params[:id])
  end
  
  def work_params
    params.permit(:title, :author, :format, :remote_id, :quantity)
  end
  
end
