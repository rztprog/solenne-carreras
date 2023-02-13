class PhotosController < ApplicationController
  def purge
    photo = ActiveStorage::Attachment.find(params[:id])
    photo.purge
  
    @photographie = Photographie.find(params[:photographie_id])
    redirect_to photography_path(@photographie)
  end
end
