module Enotas
  module ApiResource
    BASE_URL = 'http://api.enotasgw.com.br'
    SSL_BUNDLE_PATH = File.dirname(__FILE__) + '/../data/ssl-bundle.crt'

    def url_encode(key)
      URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    end

    def encode(params)
      params.map { |k,v| "#{k}=#{url_encode(v)}" }.join('&')
    end

    def api_request(url, method, params=nil)
      url = "#{BASE_URL}#{url}"
      api_key = Enotas.access_key

      if (method == :get || method == :delete) && params
        params_encoded = encode(params)
        url = "#{url}?#{params_encoded}"
        params = nil
      end

      begin
        payload = params.to_json
        response = RestClient::Request.new(method: method, url: url, payload: payload,
                                           headers: {authorization: "Basic " + api_key,
                                                        content_type: 'application/json',
                                                        accept: 'application/json'}).execute

      rescue RestClient::ExceptionWithResponse => e
        if rcode = e.http_code and rbody = e.http_body
          puts url
          puts e.http_code
          puts e.http_body
          rbody = JSON.parse(rbody)
          rbody = Util.symbolize_names(rbody)

          raise EnotasError.new(rcode, rbody, rbody, rbody.first[:mensagem])
        else
          raise e
        end
      rescue RestClient::Exception => e
        raise e
      end
      response = JSON.parse(response.to_str)
      recursive_symbolize_keys response
    end

    def recursive_symbolize_keys(h)
      case h
        when Hash
          Hash[
              h.map do |k, v|
                [ k.respond_to?(:to_sym) ? k.to_sym : k, recursive_symbolize_keys(v) ]
              end
          ]
        when Enumerable
          h.map { |v| recursive_symbolize_keys(v) }
        else
          h
      end
    end

    def self.included(base)
      base.extend(ApiResource)
    end
  end
end