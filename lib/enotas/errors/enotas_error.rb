module Enotas
  class EnotasError < StandardError
    attr_reader :http_status, :json_message, :http_message, :message

    def initialize(http_status=nil, json_message=nil, http_message=nil, message=nil)
      @http_status = http_status
      @json_message = json_message
      @http_message = http_message
      @message = message
    end
  end
end