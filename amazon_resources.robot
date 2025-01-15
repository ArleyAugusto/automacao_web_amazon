*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                 https://www.amazon.com.br/
${MENU_OFERTASDIA}    //a[@href='/deals?ref_=nav_cs_gb'][contains(.,'Ofertas do Dia')]
${EXCLUSIVO_PRIME}    //button[@data-csa-c-type='uxElement'][contains(.,'Exclusivo Prime')]
${PESQUISA_XBOX}    (//span[contains(.,'Console Xbox Series S')])[3]


*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    chrome
    
Fechar o navegador
    Capture Page Screenshot
    Close Browser    

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Sleep    2s
    Wait Until Element Is Visible    ${MENU_OFERTASDIA}

Entrar no menu "Ofertas do Dia"
    Click Element    ${MENU_OFERTASDIA}  
    Sleep    2s
    
Verificar se aparece a frase "Ofertas e Promoções"
    Wait Until Page Contains    Ofertas e Promoções
    
Verificar se o título da página fica "${TITULO}"
    Title Should Be    ${TITULO}        

Verificar se aparece a categoria "Exclusivo Prime"   
    Element Should Be Visible    ${EXCLUSIVO_PRIME}

Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Input Text    twotabsearchtextbox    Xbox Series S

Clicar no botão de pesquisa    
    Click Element    nav-search-submit-button

Verificar o resultado da pesquisa, listando o produto pesquisado
    Wait Until Element Is Visible    ${PESQUISA_XBOX}


# GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Ofertas do dia"  
    Entrar no menu "Ofertas do Dia"

Então deve aparecer na página a frase "Ofertas e Promoções"
    Verificar se aparece a frase "Ofertas e Promoções"

E o título da página deve ficar "Ofertas e Promoções | Amazon.com.br" 
    Verificar se o título da página fica "Ofertas e Promoções | Amazon.com.br"

E a categoria "Exclusivo Prime" deve ser exibida na página
    Verificar se aparece a categoria "Exclusivo Prime"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
Então um produto da linha "Xbox Series S" deve ser mostrado na página 
    Verificar o resultado da pesquisa, listando o produto pesquisado    