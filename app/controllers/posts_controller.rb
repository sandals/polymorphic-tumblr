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
end
