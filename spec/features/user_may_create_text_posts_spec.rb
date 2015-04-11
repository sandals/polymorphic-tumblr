require "rails_helper"

feature "User may create text posts" do
  scenario "Successfully" do
    text_post = build(:text_post)

    visit overview_path(as: create(:user))
    click_link "Text"

    fill_in "Title", with: text_post.title
    fill_in "Body", with: text_post.body
    click_button "Post"
    
    expect(page).to have_content(text_post.title)
    expect(page).to have_content(text_post.body)
  end
end
