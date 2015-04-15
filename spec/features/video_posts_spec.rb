require "rails_helper"

feature "Video posts" do
  scenario "creating a video post" do
    user = create(:user)
    visit overview_path(as: user)

    click_link "Video"
    fill_in "Url", with: "https://www.youtube.com/watch?v=6vYnas6q3Sg"
    click_button "Post"

    expect(page).to have_css(".post.post--video iframe")
  end
end
