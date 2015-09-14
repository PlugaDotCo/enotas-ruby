require "enotas/version"
require "rest-client"
require "json"

require "enotas/util"
require "enotas/enotas_object"
require "enotas/errors/enotas_error"

require "enotas/api_resource"
require "enotas/nfe"

module Enotas
  @@api_key = ''
  def self.api_key(api_key)
    @@api_key = api_key
  end

  def self.access_key
    @@api_key
  end
end
