require 'httparty'

RSpec.describe 'Validar a api de estacionamento' do
  it 'Deve retornar 200 para a request valida' do
    response = HttParty.get('/api/v1/parking/')
    expect(response.code).to eql(200)
  end
=begin
  it 'Deve retornar 200 e criar registro no estacionamento' do
    #body = {plate: 'AAA-1234'}
    options = {header: { Content-Type : "application/json" },body: { plate: 'AAA-1234'}}
    response = HTTParty.post('/api/v1/parking/',options)
    expect(response.code).to eql(200)
  end
=end
end