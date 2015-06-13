module ApplicationHelper
    def markdown(content)
        Kramdown::Document.new(content).to_html.html_safe
    end
end
