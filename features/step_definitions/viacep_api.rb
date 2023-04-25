Dado('que tenha um CEP válido {string}') do |zip_code|
   @zip_code = zip_code
end
  
Quando('realizo a requisição de consulta') do
    @request_address = @request_viacep.request_zip_code(@zip_code)
end

Então('devo receber o status code {int}') do |status_code|
    expect(@request_address.code).to eq(status_code)
end

E('as informações de endereço são apresentadas corretamente') do
    response_json = JSON.parse(@request_address.body)

    expect(response_json).to include(
        "cep", 
        "logradouro",
        "complemento",
        "bairro",
        "localidade",
        "ibge",
        "gia", 
        "uf",
        "ddd",
        "siafi"
    )

    response_json.each do |value|
        expect(value).not_to be_nil
    end
end

Dado('que tenha um Cep inexistente') do
    @zip_code = "99999-999"
end

E('uma mensagem deve ser apresentada informando o erro na consulta') do
    response_json = JSON.parse(@request_address.body)["erro"]
    expect(response_json).to eq(true)
end

Dado('que tenha um Cep inválido') do
    @zip_code = "99999-ttt"
end

Então('o status code deve retornar {int}') do |status_code|
    expect(@request_address.code).to eq(status_code)
end