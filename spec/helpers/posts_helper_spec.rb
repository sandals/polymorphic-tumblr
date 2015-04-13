require "rails_helper"

describe PostsHelper do
  describe "#render_with_pipeline" do
    it "renders plaintext given no pipeline filters" do
      result = helper.render_with_pipeline("String")

      expect(result).to eq("String")
    end

    it "will convert a single filter into something usable" do
      result = helper.render_with_pipeline("Text with :+1: emoji", :emoji)

      expect(result).to have_css("p img")
    end

    it "converts given pipeline filter symbols to their corresponding filters" do
      result = helper.render_with_pipeline("Text *with* md", [:markdown])

      expect(result).to eq("<p>Text <em>with</em> md</p>")
    end
  end
end
