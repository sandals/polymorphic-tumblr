class ProfileController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end
end
