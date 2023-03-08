module ApplicationHelper

    require "uri"

    def text_url_to_link text

        URI.extract(text, ['http','https']).uniq.each do |url|
        sub_text = ""
        url_tmp = truncate(url,omission:"...",length:20)
        sub_text << "<a class=\"post_link_url\" href=" << url << " target=\"_blank\">" << url_tmp << "</a>"

        text.gsub!(url, sub_text)
        end
        return text
    end
end
