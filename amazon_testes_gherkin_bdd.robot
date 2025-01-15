*** Settings ***
Documentation    Essa suite testa o site da Amazon.com
Resource         amazon_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Ofertas do Dia"
    [Documentation]    Esse teste verifica o menu eletronicos do site da Amazon.com.br
    ...                e verifica a categoria Ofertas e Promoções
    [Tags]             menus  categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Ofertas do dia"
    Então deve aparecer na página a frase "Ofertas e Promoções"
    E o título da página deve ficar "Ofertas e Promoções | Amazon.com.br"
    E a categoria "Exclusivo Prime" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então um produto da linha "Xbox Series S" deve ser mostrado na página   