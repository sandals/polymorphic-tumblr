class ProfileController < ApplicationController
  layout 'profile'

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end
end
