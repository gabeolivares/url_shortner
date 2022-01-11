class RedirectController < ApplicationController
    def redirect
      valid_params
      base_url = request.base_url
      url_param = "#{base_url}/#{params['short_url']}"
      url = Url.find_by(short_url: url_param)
      redirect_to url.long_url
    end

    private
    def valid_params
      params.permit(:short_url)
    end
end
