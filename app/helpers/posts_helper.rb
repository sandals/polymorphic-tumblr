module PostsHelper
  def markdown_to_html(markdown_string)
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter
    ]
    result = pipeline.call(markdown_string)
    result[:output].to_s
  end
end
