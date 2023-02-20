class PhotosController < ApplicationController
  def purge_photographie
    photo = ActiveStorage::Attachment.find(params[:id])
    photo.purge
  
    @photographie = Photographie.find(params[:photographie_id])
    @graphisme = Photographie.find(params[:graphisme_id])

    redirect_to photography_path(@photographie)
  end

  def purge_graphisme
    photo = ActiveStorage::Attachment.find(params[:id])
    photo.purge
  
    @graphisme = Photographie.find(params[:graphisme_id])

    redirect_to graphisme_path(@graphisme)
  end
end
