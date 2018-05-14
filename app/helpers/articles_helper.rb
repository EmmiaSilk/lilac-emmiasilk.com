module ArticlesHelper
  # Settings for redcarpet renderers
  @@redcarpet_options = {
    filter_html: true,
    hard_wrap: true,
    link_attributes: { rel: 'nofollow', target: '_blank'},
    space_after_header: true,
    fenced_code_blocks: true,
  }
  @@redcarpet_extensions = {
    autolink: true,
    superscript: true,
    strikethrough: true,
    underline: true,
    disable_indented_code_blocks: true,
    no_intra_emphasis: true,
  }

  def markdown_article(text, header_level: 1)
    render_options = {
      header_level: header_level, # The article name header is #h1
    }
    extensions = @@redcarpet_extensions

    renderer = LilacRender.new(@@redcarpet_options.merge(render_options) )
    markdown = Redcarpet::Markdown.new(renderer, @@redcarpet_extensions)

    markdown.render(text).html_safe()
  end

  def markdown_comment(text, header_level: 1)
    render_options = {
      disable_headers: true,
      header_level: header_level, # The "Comments" header is #h2
    }

    renderer = LilacRender.new(@@redcarpet_options.merge(render_options) )
    markdown = Redcarpet::Markdown.new(renderer, @@redcarpet_extensions)

    markdown.render(text).html_safe()
  end
end
