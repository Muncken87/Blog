module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end
  def markdown(body)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: false)
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
