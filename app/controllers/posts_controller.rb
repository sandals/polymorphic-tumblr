class PostsController < ApplicationController
  before_action :require_login

  def destroy
    post = current_user.posts.find_by(id: params[:id])

    if post.destroy
      redirect_to overview_path
    else
      flash[:error] = "Nope"
      redirect_to overview_path
    end
  end

  def reblog
    dup = Post.find_by(id: params[:id]).dup
    dup.reblogged = true
    dup.original_poster = dup.user_id
    current_user.posts << dup
    redirect_to overview_path
  end
end
