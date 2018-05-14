# Special custom renderer for this site.
# Accepts the following options in the initialize:
#
# `header_level` - Level of the starting header. With header_level 1,
# the first level of header is <h1>.
#
# `disable_headers` - If true, headers will instead render as <p>.
class LilacRender < Redcarpet::Render::HTML
  def header(text, level)
    realLevel = level + @options[:header_level] - 1

    if (realLevel <= 6 && @options[:allow_headers])
      return "<h#{realLevel}>#{text}</h#{realLevel}>"
    else
      hashes = "#"*level
      return "<p>#{hashes} #{text}<p>"
    end
  end
end
