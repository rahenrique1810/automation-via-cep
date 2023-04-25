# Testes Automatizados

## Sobre a tecnologia

A linguagem utilizada no projeto é ruby, e também utilizei o cucumber para deixar uma linguagem de fácil entendimento.

### Como começar

1. Instale o rbenv e dependências:
     
    - Primeiramente, atualize sua lista de pacotes:  
     
        `sudo apt update`

    - Em seguida, instale as dependências necessárias para instalar o Ruby:

        `sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev`
    
    - Assim que baixar as dependências, instale o rbenv, Clone o repositório rbenv do GitHub para o diretório ~/.rbenv:

        `git clone https://github.com/rbenv/rbenv.git ~/.rbenv`

    - Em seguida, adicione ~/.rbenv/bin ao seu $PATH

        `echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc`
    
    - Adicione o comando eval "$(rbenv init -)" ao seu arquivo ~/.bashrc para que o rbenv carregue automaticamente:

        `echo 'eval "$(rbenv init -)"' >> ~/.bashrc`

    - Aplique as alterações que você fez ao arquivo ~/.bashrc na sua sessão de shell atual:

        `type rbenv`
    
    - Sua janela do terminal mostrará o seguinte:

        ```
        rbenv is a function
        rbenv ()
        {
            local command;
            command="${1:-}";
            if [ "$#" -gt 0 ]; then
                shift;
            fi;
            case "$command" in
                rehash | shell)
                    eval "$(rbenv "sh-$command" "$@")"
                ;;
                *)
                    command rbenv "$command" "$@"
                ;;
            esac
        }
        ```

    - Em seguida, instale o plug-in ruby-build. Este plug-in adiciona o comando rbenv install que simplifica o processo de instalação para novas versões do Ruby:

        `git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build`

2. Instalando o Ruby com o ruby-build
    
    - Instale o Ruby 3.2.2 com o seguinte comando:

        `rbenv install 3.2.2`

    - Ajuste a versão instalada do ruby como a versão padrão do Ruby:

      `rbenv global 3.2.2`
 
    - Verifique se a versão do Ruby está correta:

        `ruby --version`

    - A seguinte mensagem deve ser apresentada
    
        `ruby 3.2.2`

3. Instale a Gem Bundler
    
    `gem install Bundler`

4. Instale o Cucumber 

    `gem install Cucumber`

5. Navegar até a raiz do projeto:

    ```bash
    ~$ cd ~/${CAMINHO_DO_SEU_WORKSPACE}/viaCep
    ```

6. Instalando as dependências do projeto:

    ```bash
        bundle install
    ```

### Como executar os testes

- Utilize o comando abaixo para rodar os testes gerando o relatório Allure Reports.

    ```bash
        cucumber -t @validar_api_via_cep -p regression_report
    ```

### Como abrir o relatório: 

1. Realize a instalação do Allure Reports https://docs.qameta.io/allure/

2. Navegue até a raiz do projeto:

    ```bash
    ~$ cd ~/${CAMINHO_DO_SEU_WORKSPACE}/
    ```
3. Utilize o seguinte comando para abrir o relatório de testes:
    
    ```bash
        ~$ allure serve allure-report
    ```