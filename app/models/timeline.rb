class Timeline
  include ActiveModel::Model
  extend ActiveModel::Naming

  def initialize(user)
    @user = user
  end

  def posts
    Post.where(user_id: timeline_user_ids)
  end

  private

  def timeline_user_ids
    [@user.id] + @user.followed_user_ids
  end
end
