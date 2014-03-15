class HTTPHelper
  def self.make_get_request (url, params)
    uri = URI(url)
    #params = { :q => 'Samara,RU' }
    uri.query = URI.encode_www_form(params)

    res = Net::HTTP.get_response(uri)

    if res.is_a?(Net::HTTPSuccess)
      res.body
    else
      raise ('No data retrieved for ' + url + ' url..')
    end
  end
end