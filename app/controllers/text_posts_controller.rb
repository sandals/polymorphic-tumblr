class TextPostsController < ApplicationController
  def new
    @new_text_post = TextPost.new
  end

  def create
    text_post = current_user.posts.new(postable: build_text_post)

    if !text_post.save
      flash[:error] = "Could not save post."
    end

    redirect_to overview_path
  end

  private

  def build_text_post
    TextPost.new(text_post_params)
  end

  def text_post_params
    params.require(:text_post).permit(:title, :body)
  end
end
