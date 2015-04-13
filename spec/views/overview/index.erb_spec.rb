require "rails_helper"

describe "overview/index.html.erb" do
  it "renders the markdown of a text post" do
    user = create(:user)
    text_post = build(:text_post)
    text_post.body = "With some *markdown*"

    assign(:posts, user.posts.all)
    assign(:text_post, user.posts.create(postable: text_post))

    render

    expect(rendered).to have_content("With some markdown")
    expect(rendered).to have_css(".post em")
  end
end
