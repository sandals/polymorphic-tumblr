require "rails_helper"

feature "Timeline" do
  scenario "timeline will contain your own posts" do
    user = create(:user)
    5.times { user.posts.create(postable: build(:text_post)) }
    
    visit overview_path(as: user)
    expect(page).to have_content(build(:text_post).title)
  end

  scenario "timeline contains followed users posts as well" do
    user = create(:user)
    other = build(:user)
    other.email = "other@example.com"
    other.save

    user_text_post = build(:text_post)

    other_text_post = build(:text_post)
    other_text_post.title = "Other Title"
    other_text_post.body = "Other body :)"

    user.posts.create(postable: user_text_post)
    other.posts.create(postable: other_text_post)

    visit profile_path(other, as: user)
    click_button "Follow"
    visit overview_path

    expect(page).to have_content(other_text_post.title)
    expect(page).to have_content(user_text_post.title)
  end
end
