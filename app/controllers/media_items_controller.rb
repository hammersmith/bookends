class MediaItemsController < ApplicationController

  def create
    media_item = MediaItem.new(media_item_params)
    if media_item.save
      render json: { id: media_item.id }
    else
      render nothing: true, status: :not_acceptable
    end
  end
  
  private
  
  def media_item_params
    params.permit(:title, :author, :format, :remote_id)
  end
  
end
