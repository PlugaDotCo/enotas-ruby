require 'spec_helper'

describe Enotas do
  it 'has a version number' do
    expect(Enotas::VERSION).not_to be nil
  end

  it 'should set api key' do
    Enotas.api_key('NmEwOTExNTMtNjk2NS00ZjZhLWIyZGQtZGRmNGVmNTE5NDc3')
    expect(Enotas.access_key).to eq('NmEwOTExNTMtNjk2NS00ZjZhLWIyZGQtZGRmNGVmNTE5NDc3')
  end

  describe Enotas::EnotasObject do
    it 'should have a metaclass' do
      enotas_object = Enotas::EnotasObject.new
      expect(enotas_object.metaclass.class).to eq(Class)
    end

    it 'should convert to hash' do
      params_2 = {a: 1, b: 'b'}
      params = {a: 'a', b: 'b', c: 1, d: Enotas::EnotasObject.create_from(params_2), e:[a: 'a', b: 1, c: Enotas::EnotasObject.create_from(params_2)]}
      obj = Enotas::EnotasObject.create_from(params)
      expect(obj.to_hash).to eq(params.merge({d: params_2, e: [a: 'a', b: 1, c: params_2]}))
    end

    it 'should convert to json' do
      params_2 = {a: 1, b: 'b'}
      params = {a: 'a', b: 'b', c: 1, d: Enotas::EnotasObject.create_from(params_2), e:[a: 'a', b: 1, c: Enotas::EnotasObject.create_from(params_2)]}
      obj = Enotas::EnotasObject.create_from(params)
      expect(obj.to_json).to eq(params.to_json)
    end

    it 'should convert to string' do
      params_2 = {a: 1, b: 'b'}
      params = {a: 'a', b: 'b', c: 1, d: Enotas::EnotasObject.create_from(params_2), e:[a: 'a', b: 1, c: Enotas::EnotasObject.create_from(params_2)]}
      obj = Enotas::EnotasObject.create_from(params)
      expect(obj.to_s).to eq(params.to_json.to_s)
    end
  end
end
