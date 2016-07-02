module ApplicationHelper
  def markdown(body)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true,filter_html: true)
    options = {
      autolink: true,
      disable_indented_code_blocks: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      striketrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(body).html_safe
  end
end
