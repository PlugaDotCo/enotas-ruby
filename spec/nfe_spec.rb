require 'spec_helper'

describe Enotas::Nfe do
  before(:each) do
    customer_params = {
        tipo: 'NFS-e',
        idexterno: "123",
        cliente: { cpfCnpj: '01946377198',
                   nome: 'Ricardo Caldeira',
                   email: 'ricardo.nezz@mailinator.com',
                   endereco: {
                     uf: 'MG',
                     cidade: 'Belo Horizonte',
                     logradouro: 'Rua 01',
                     numero: '112',
                     complemento: 'AP 202',
                     bairro: 'Savassi',
                     cep: '32323111',
                   }}}
    service_params = { servico: {descricao: 'Discriminação do Servico'}, valorTotal: 10.90 }
    Enotas.api_key('NmEwOTExNTMtNjk2NS00ZjZhLWIyZGQtZGRmNGVmNTE5NDc3')
    @empresa_id = "d29c6bd5-d3ce-489b-aafe-f5e2cebe0000"
    @nfe = customer_params.merge(service_params)
  end

  it 'should create a Nfe' do
    nfe = Enotas::Nfe.create(@empresa_id, @nfe)
    expect(nfe[:nfeId]).to be_truthy
  end

  it 'should retrieve a Nfe by id' do
    nfe_id = "04097b2b-f6e7-4886-95f9-efb32ccb0000"
    nfe = Enotas::Nfe.retrieve(@empresa_id, nfe_id)

    expect(nfe[:id]).to eq(nfe_id)
  end

  it 'should retrieve a Nfe by external id' do
    nfe = Enotas::Nfe.retrieve_by_external_id(@empresa_id, "1")

    expect(nfe[:idExterno]).to eq("1")
  end

  it 'should cancel a Nfe' do
    nfe_created = Enotas::Nfe.create(@empresa_id, @nfe)

    expect(nfe_created[:nfeId]).to be_truthy
    expect{ Enotas::Nfe.cancel(@empresa_id, nfe_created[:nfeId]) }.to raise_error Enotas::EnotasError
  end

  it 'should cancel a Nfe by external id' do
    expect{ Enotas::Nfe.cancel_by_external_id(@empresa_id, "123") }.to raise_error Enotas::EnotasError
  end
end
