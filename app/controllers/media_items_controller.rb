class MediaItemsController < ApplicationController
  
  before_filter :find_media_item, only: [:show]

  def create
    media_item = MediaItem.new(media_item_params)
    if media_item.save
      render json: { 
        remoteId: media_item.remote_id,
        form: render_to_string(partial: 'update_form', locals: { media_item: media_item })
      }
    else
      render nothing: true, status: :not_acceptable
    end
  end
  
  def show
  end
  
  def check_inventory
    inventory = MediaItem.where(remote_id: params[:gbIds]).select(:id, :quantity, :remote_id).map do |item|
      {
        remoteId: item.remote_id,
        form: render_to_string(partial: 'update_form', locals: { media_item: item })
      }
    end
    
    render json: inventory
  end
  
  private
  
  def find_media_item
    @media_item = MediaItem.find(params[:id])
  end
  
  def media_item_params
    params.permit(:title, :author, :format, :remote_id, :quantity)
  end
  
end
