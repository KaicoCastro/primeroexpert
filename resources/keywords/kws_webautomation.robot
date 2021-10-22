
*** Settings ***
Documentation        Aqui estarão presentes todas as keywords dos testes Web.
Library             SeleniumLibrary
*** Variables ***
${BROWSE}             chrome        
${URL}                http://automationpractice.com/index.php

*** Keywords ***
Abrir navegador
    Open Browser        browser${BROWSER}
    Maximize Browser Window
Fechar navegador
    Capture Page Screenshot
    Close Browser
Acessar a página home do site Automation Practice
    Go to         ${URL}
    Title Should Be                  My Store
    Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul
Digitar o nome do produto "${​PRODUTO}​" no campo de pesquisa
    Input Text    id=search_query_top${​PRODUTO}​
Clicar no botão pesquisar
    Click Element    name=submit_search
Conferir se o produto "${​PRODUTO}​" foi listado no site
    Page Should Contain Image    xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Title Should Be              Search - My Store
*** Settings ***
Documentation        Aqui estarão presentes os primeiros testes automatizados Web.
Resource             ../resources/keywords/kws_webautomation.robot
Test Setup           Abrir navegador
Test Teardown        Fechar navegador
*** Test Cases ***

Caso de Teste 01: Pesquisar produto existente
    [Tags]            PESQUISAR
    Acessar a página home do site Automation Practice
Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text        id=search_query_top    ${PRODUTO}
Clicar no botão pesquisar
    Click Element    name=submit_search
 Conferir se o produto "Blouse" foi listado no site
     Page Should Contain Image    

    