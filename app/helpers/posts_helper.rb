module PostsHelper
  def render_with_pipeline(renderable_string, filters=[])
    filter_codex = {
      :markdown => HTML::Pipeline::MarkdownFilter,
      :sanitize => HTML::Pipeline::SanitizationFilter,
      :emoji => HTML::Pipeline::EmojiFilter
    }

    pipeline_filters = [filters]
      .flatten
      .collect { |filter| filter_codex[filter] }
      .uniq

    context = {
      :asset_root => "https://a248.e.akamai.net/assets.github.com/images/icons"
    }

    pipeline = HTML::Pipeline.new(pipeline_filters, context)

    pipeline.to_html(renderable_string)
  end
end
