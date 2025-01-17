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
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Ofertas do Dia"
    Verificar se aparece a frase "Ofertas e Promoções"
    Verificar se o título da página fica "Ofertas e Promoções | Amazon.com.br"
    Verificar se aparece a categoria "Exclusivo Prime"

Caso de Teste 02 - Pesquisa de um produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca_produtos
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, listando o produto pesquisado 