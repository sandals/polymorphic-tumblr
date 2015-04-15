class VideoPostsController < ApplicationController
  def new
  end

  def create
    video_post = current_user.posts.new(postable: build_video_post)

    if video_post.save
      redirect_to overview_path
    else
      flash[:error] = "Video posts must have a valid URL!"
      render :action => :new
    end
  end

  private
  
  def build_video_post
    VideoPost.new(video_post_params)
  end
  
  def video_post_params
    params.require(:video_post).permit(:url)
  end
end
