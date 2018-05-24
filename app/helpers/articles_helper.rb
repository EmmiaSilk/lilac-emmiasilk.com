module ArticlesHelper
  # Settings for redcarpet renderers
  @@redcarpet_options = {
    filter_html: true,
    hard_wrap: true,
    link_attributes: { rel: 'nofollow', target: '_blank'},
    space_after_header: true,
    fenced_code_blocks: true,
    safe_links_only: true, # Prevents XSS attacks
  }
  @@redcarpet_extensions = {
    autolink: true,
    superscript: true,
    strikethrough: true,
    underline: true,
    disable_indented_code_blocks: true,
    no_intra_emphasis: true,
  }

  def markdown(text, header_level: 1, allow_headers: false)
    options = @@redcarpet_options.merge({
      header_level: header_level, # The article name header is #h1
      allow_headers: allow_headers,
    })
    extensions = @@redcarpet_extensions.merge({})

    renderer = LilacRender.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe()
  end
end
