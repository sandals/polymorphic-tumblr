require "rails_helper"

feature "Users have profile" do
  scenario "viewing a user profile as a guest" do
    user = create(:user)
    user.posts.create(postable: build(:text_post))

    visit profile_path(user)

    expect(page).to have_content(build(:text_post).title)
    expect(page).to_not have_content("Delete")
  end
end
