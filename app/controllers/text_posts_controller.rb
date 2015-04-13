class TextPostsController < ApplicationController
  def new
  end

  def create
    text_post = current_user.posts.new(postable: build_text_post)

    if text_post.save
      redirect_to overview_path
    else
      flash[:error] = "Text posts require some content!"
      render :new
    end
  end

  private

  def build_text_post
    TextPost.new(text_post_params)
  end

  def text_post_params
    params.require(:text_post).permit(:title, :body)
  end
end
