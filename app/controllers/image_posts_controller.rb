class ImagePostsController < ApplicationController
  def new
  end

  def create
    image_post = current_user.posts.new(postable: build_image_post)

    if image_post.save
      redirect_to overview_path
    else
      flash[:error] = "Image posts require a file!"
      render :new
    end
  end

  private

  def build_image_post
    ImagePost.new(image_post_params)
  end

  def image_post_params
    params.fetch(:image_post, {}).permit(:image)
  end
end
