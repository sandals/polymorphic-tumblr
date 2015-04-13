require "rails_helper"

feature "User may destroy their posts" do
  scenario "Destroying a post" do
    user = create(:user)
    visit overview_path(as: user)
    text_post = build(:text_post)

    visit overview_path
    click_link "Text"
    fill_in "Title", with: text_post.title
    fill_in "Body", with: text_post.body
    click_button "Post"

    visit overview_path
    click_link "Delete"

    expect(page).to_not have_content(text_post.title)
    expect(page).to_not have_content(text_post.body)
  end
end
