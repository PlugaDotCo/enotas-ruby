module Enotas
  class Nfe < EnotasObject
    include ApiResource

    def self.company_id(company_id)
      @company_id = company_id
    end

    def self.url
      "/v1/empresas/#{@company_id}/nfes"
    end

    def url
      "#{self.class.url}/#{self.id}"
    end

    def self.create(id_empresa, params)
      @company_id = id_empresa
      method = :post
      response = api_request(url, method, params)
      create_from(response)
    end

    def self.retrieve(id_empresa, obj_id)
      @company_id = id_empresa
      obj_id = "?id=#{obj_id}" if obj_id.include? '@'
      method = :get
      response = api_request("#{url}/#{obj_id}",method)
      create_from(response)
    end

    def self.retrieve_by_external_id(id_empresa, external_id)
      @company_id = id_empresa
      method = :get
      response = api_request("#{url}/porIdExterno/#{external_id}",method)
      create_from(response)
    end

    def self.retrieve_by_period(id_empresa, params)
      @company_id = id_empresa
      method = :get
      response = api_request(url, method, params)
      create_from(response)
    end

    def self.cancel(id_empresa, obj_id)
      @company_id = id_empresa
      obj_id = "?id=#{obj_id}" if obj_id.include? '@'
      method = :delete
      response = api_request("#{url}/#{obj_id}",method)
      create_from(response)
    end

    def self.cancel_by_external_id(id_empresa, external_id)
      @company_id = id_empresa
      method = :delete
      response = api_request("#{url}/porIdExterno/#{external_id}",method)
      create_from(response)
    end

    def self.create_from(params)
      params
    end
  end
end