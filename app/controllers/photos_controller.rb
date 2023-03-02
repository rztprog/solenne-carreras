class PhotosController < ApplicationController
  skip_before_action :authenticate_user!

  def purge_photographie
    photo = ActiveStorage::Attachment.find(params[:id])
    Cloudinary::Uploader.destroy(photo.key)
    photo.purge
  
    @photographie = Photographie.find(params[:photographie_id])

    redirect_to photography_path(@photographie)
  end

  def purge_graphisme
    photo = ActiveStorage::Attachment.find(params[:id])
    Cloudinary::Uploader.destroy(photo.key)
    photo.purge
  
    @graphisme = Photographie.find(params[:graphisme_id])

    redirect_to graphisme_path(@graphisme)
  end
end
