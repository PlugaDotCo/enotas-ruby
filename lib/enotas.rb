require "enotas/version"
require "rest-client"
require "json"

module Enotas
  @@api_key = ''
  def self.api_key(api_key)
    @@api_key = api_key
  end

  def self.access_key
    @@api_key
  end
end
