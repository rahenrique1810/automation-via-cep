#language: pt

@validar_api_via_cep
Funcionalidade: Validar se o endpoint de consulta de endereços via cep está retornando informações corretas 
    Eu como um analista 
    Posso realizar requisições no Endpoint dos correios
    Para validar se as informações de retorno de endereço estão corretas

    @cep_valido
    Esquema do Cenário: Validar a consulta de um cep válido
        Dado que tenha um CEP válido <cep>
        Quando realizo a requisição de consulta
        Então devo receber o status code 200 
        E as informações de endereço são apresentadas corretamente

        Exemplos: 
        |cep                            |
        |"58410-316"                    |
        |"49037-353"                    |
        |"60325-220"                    |
        |"96501-395"                    |
        |"69313-278"                    |
        |"29025-673"                    |

    @cep_inexistente
    Cenário: Validar a consulta de um CEP inexistente
        Dado que tenha um Cep inexistente
        Quando realizo a requisição de consulta
        Então devo receber o status code 200
        E uma mensagem deve ser apresentada informando o erro na consulta

    @cep_invalido
    Cenário: Validar a consulta de um CEP inválido
        Dado que tenha um Cep inválido
        Quando realizo a requisição de consulta
        Então o status code deve retornar 400