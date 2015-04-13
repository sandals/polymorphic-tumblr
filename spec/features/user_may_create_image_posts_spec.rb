require "rails_helper"

feature "User may create text posts" do
  scenario "Without uploading an image" do
    visit overview_path(as: create(:user))
    click_link "Image"
    click_button "Post"

    expect(page).to have_content("Image posts require a file!")
  end

  scenario "Successfully" do
    visit overview_path(as: create(:user))
    click_link "Image"

    attach_file "Image", File.join(Rails.root, "/spec/factories/files/img.jpg")
    click_button "Post"
    
    expect(page).to have_css(".post img.post__image")
  end
end
