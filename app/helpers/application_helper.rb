module ApplicationHelper

  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  class HTMLWithPants < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants
  end

  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      autolink:            true,
      space_after_headers: true,
      fenced_code_blocks:  true,
      superscript:         true,
      underline:           true,
      highlight:           true,
      footnotes:           true,
      quote:               true,
      tables:              true
    })
    @markdown.render(content).html_safe
  end
end