module ApplicationHelper
    def auth_token
        "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{h(form_authenticity_token)}\"/>".html_safe
    end

    def delete_method
        "<input type=\"hidden\" name=\"_method\" value=\"delete\"/>".html_safe
    end

    def patch_method
        "<input type=\"hidden\" name=\"_method\" value=\"patch\"/>".html_safe
    end

    def ugly_lyrics(lyrics)
        
        safe_lyrics = h(lyrics).chars.map do |char|
            if char == "\n"
                char + "&#9835; "
            else
                char
            end
        end.join("")

        html = "<pre>"
        html += safe_lyrics
        html += "</pre>"
        html.html_safe
    end
end

