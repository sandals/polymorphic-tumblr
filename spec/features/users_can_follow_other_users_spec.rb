require "rails_helper"

feature "Users can follow other users" do
  scenario "following an unfollowed user" do
    user = create(:user)
    other = build(:user)
    other.email = "other@example.com"
    other.save

    visit profile_path(other, as: user)
    click_button "Follow"

    expect(page).to have_content("Now following")
    expect(page).to have_button("Unfollow")
  end

  scenario "unfollowing a followed user" do
    user = create(:user)
    other = build(:user)
    other.email = "other@example.com"
    other.save

    visit profile_path(other, as: user)
    click_button "Follow"

    expect { click_button "Unfollow" }.to(
      change { user.followed_users.count }.from(1).to(0)
    )
  end
end
