class UrlShortenerController < ApplicationController
  def convert
    valid_params
    url = params["url"]
    short_url = generate_short_url
    @url = Url.new(long_url: url, short_url: short_url)
    if @url.save
      render html: "#{@url.long_url} has been converted to <a href='#{@url.short_url}'>#{@url.short_url}</a>".html_safe
    end
  end


  private
  def generate_short_url
    base_url = request.base_url
    append_url = rand(36**6).to_s(36)
    "#{base_url}/#{append_url}"
  end

  def valid_params
    params.permit(:url)
  end
end
