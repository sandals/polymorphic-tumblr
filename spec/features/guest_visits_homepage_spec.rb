require "rails_helper"

feature "Guest visits homepage" do
  scenario "without being authenticated" do
    visit root_path

    expect(page).to have_content("Sign up")
    expect(page).to have_content("Sign in")
  end

  scenario "as an authenticated user" do
    visit root_path(as: create(:user))

    expect(current_path).to eq(overview_path)
  end
end
