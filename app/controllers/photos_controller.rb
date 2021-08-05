class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({:template => "photo_templates/index.html.erb"})
  end

  def show
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({:id => url_id})

    @the_photo = matching_photos.first

    render({:template => "photo_templates/show.html.erb"})
  end

  def delete
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({:id => url_id})

    the_photo = matching_photos.first

    the_photo.destroy

    redirect_to("/photos")
    
  end

  def create
    input_image = params.fetch("input_image")

    input_caption = params.fetch("input_caption")

    input_owner_id = params.fetch("input_owner_id")

    new_photo = Photo.new 
    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id

    new_photo.save

    redirect_to("/photos/" + new_photo.id.to_s)
  end

  
  def create_comment
    input_image_id = params.fetch("input_image_id")

    input_author_id = params.fetch("input_author_id")

    input_caption = params.fetch("input_comment")

    new_comment = Comment.new 
    new_comment.id = input_image_id
    new_comment.body = input_caption
    new_comment.author_id = input_author_id

    new_comment.save

    redirect_to("/photos/#{input_image_id}")
  end

  def update
    image_id = params.fetch("path_id")
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")

    update_photo = Photo.where({:id => image_id}).first

    update_photo.image = input_image
    update_photo.caption = input_caption

    update_photo.save

    redirect_to("/photos/#{update_photo.id.to_s}")
  end
end