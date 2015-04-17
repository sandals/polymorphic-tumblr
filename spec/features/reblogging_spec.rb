require "rails_helper"

feature "Reblogging" do
  scenario "reblogging a post" do
    user = create(:user)
    other = build(:user)
    other.email = "other@example.com"
    other.save

    user.posts.create(postable: build(:text_post))

    visit profile_path(user, as: other)
    click_button "Follow"
    visit overview_path

    click_link "Reblog"

    expect(page).to have_content("other@example.com reblogged user@example.com")
    expect(other.posts.count).to eq(1)
  end
end
