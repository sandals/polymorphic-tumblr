require "rails_helper"

describe Post do
  it "should order posts by created_at desc" do
    user = create(:user)
    text_post = user.posts.create(postable: build(:text_post))
    new_text_post = user.posts.create(postable: build(:text_post))
    
    expect(Post.all).to eq([new_text_post, text_post])
  end
end
