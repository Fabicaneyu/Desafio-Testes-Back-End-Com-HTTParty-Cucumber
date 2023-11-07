#language:pt 

@get_viacep
Funcionalidade: Consultar um único CEP

@consulta_umcep
Cenário: Consultar um único CEP de 8 dígitos que existe na base
    Dado que eu acesso a viacep
    Quando pesquiso um cep de 8 dígitos que existe na base da API dos correios
    Então eu recebo o respectivo endereço

@consulta_cep9digitos
Cenário: Consultar um único CEP de 9 dígitos que não existe na base
    Dado que eu faço uma requisição na viacep
    Quando pesquiso um cep de 9 dígitos que não existe na base da API dos correios
    Então eu recebo o retorno

@consulta_cep7digitos
Cenário: Consultar um único CEP de 7 dígitos que não existe na base
    Dado que eu acesso a api da viacep
    Quando pesquiso um cep de 7 dígitos que não existe na base da API dos correios
    Então eu recebo o retorno de que não pôde ser encontrada devido a um problema com o endereço

@consulta_viacep
Cenário: Consultar um CEP
    Dado que eu possua o cep 05339000
    Quando pesquiso na API dos correios
    Então eu recebo o endereço Avenida Corifeu de Azevedo Marques
