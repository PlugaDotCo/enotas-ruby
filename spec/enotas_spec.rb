require 'spec_helper'

describe Enotas do
  it 'has a version number' do
    expect(Enotas::VERSION).not_to be nil
  end

  it 'should set api key' do
    Enotas.api_key('pk_test_1234')
    expect(Enotas.access_key).to eq('pk_test_1234')
  end
end
