module SessionsHelper

  def flash_message
    flash.map do |type, message|
      content_tag(:p, flash[type], class: "flash #{type}") do
        message
      end
    end.join.html_safe
   end

  end

