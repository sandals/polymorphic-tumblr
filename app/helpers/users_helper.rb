module UsersHelper
  def profile_link(user)
    found = User.find(user)
    link_to found.email, profile_path(found)
  end
end
