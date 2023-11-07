#Consultar um único CEP de 8 dígitos que existe na base

Dado('que eu acesso a viacep') do
    @getcep = 'https://viacep.com.br/ws/08225520/json/' #faço a requisição para uma url
  end
  
  Quando('pesquiso um cep de {int} dígitos que existe na base da API dos correios') do |int|
    @list_viacep = HTTParty.get(@getcep) #salvo o response da requisição em uma variável
  end

  Então('eu recebo o respectivo endereço') do
    expect(@list_viacep.code).to eql 200  #comparo o retorno do response
    expect(@list_viacep.message).to eql 'OK'
  end

# Consultar um único CEP de 9 dígitos que não existe na base

Dado('que eu faço uma requisição na viacep') do
    @getcep = 'https://viacep.com.br/ws/111111111/json/' #faço a requisição para uma url
  end
  
  Quando('pesquiso um cep de {int} dígitos que não existe na base da API dos correios') do |int|
    @list_viacep = HTTParty.get(@getcep) #salvo o response da requisição em uma variável
  end

  Então('eu recebo o retorno') do
    expect(@list_viacep.code).to eql 400  #comparo o retorno do response
    expect(@list_viacep.message).to eql 'Bad Request'
  end



# Consultar um único CEP de 7 dígitos que não existe na base

Dado('que eu acesso a api da viacep') do
    @getcep = 'https://viacep.com.br/ws/1111111/json/'
  end
  
  Então('eu recebo o retorno de que não pôde ser encontrada devido a um problema com o endereço') do
    expect(@list_viacep.code).to eql 400  #comparo o retorno do response
    expect(@list_viacep.message).to eql 'Bad Request'
  end

# Consulta geral viacep
  Dado('que eu possua o cep {int}') do |int|
        @getcep = 'https://viacep.com.br/ws/05339000/json/' 
    end
    
    Quando('pesquiso na API dos correios') do
        @list_viacep = HTTParty.get(@getcep)
    end
    
    Então('eu recebo o endereço Avenida Corifeu de Azevedo Marques') do
        expect(@list_viacep.code).to eql 200  #comparo o retorno do response
        expect(@list_viacep.message).to eql 'OK'
        expect(@list_viacep ["logradouro"]).to eql 'Avenida Corifeu de Azevedo Marques'
        expect(@list_viacep ["cep"]).to eql '05339-000'
    end
