*** Settings ***
Library  SeleniumLibrary

*** variables ***

${URL}            http://automationpractice.com
${BROWSER}        chrome

*** Keywords ***
# --- Inicio: Setup e TEARDOWN ---
Abrir navegador
    Open Browser    about:blank    ${BROWSER}

Fechar navegador

    Close Browser
# --- Fim: Setup e TEARDOWN ---

Acessar a pagina home do site
    [Documentation]    Palavra chave utilizada em todos os casos de teste deste cenario
    Go To    http://automationpractice.com
    Maximize Browser Window
    Title Should Be    My Store

Digite o nome do produto "${PRODUTO}" no campo de Pesquisar
        Input Text    name = search_query    ${PRODUTO}

Clicar no botão Pesquisar
        Click Element    name = submit_search


# --- Inicio do teste: Caso de Teste 01: Pesquisar produto existente ---
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible    xpath = //*[@id="center_column"]//h1//span[1]
    Scroll Element Into View    xpath = //*[@id="center_column"]/ul/li/div/div[2]/div[1]/span
    Title Should Be    Search - My Store
    Page Should Contain Image    xpath = //*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Capture Page Screenshot
# --- Fim do teste: Caso de Teste 01: Pesquisar produto existente ---

# --- Inicio do teste: Caso de Teste 02: Pesquisar produto não existente ---
Conferir mensagem de erro "${PRODUTO}"
    Title Should Be    Search - My Store
    Wait Until Element Is Visible    xpath = //p[@class='alert alert-warning']
    Element Should Be Visible        xpath = //p[@class='alert alert-warning']
    Capture Page Screenshot
# --- Fim do teste: Caso de Teste 02: Pesquisar produto não existente ---

# --- Inicio do teste: Caso de Teste 03: Listar Produtos ---
Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Wait Until Element Is Visible    xpath = //a[text()='Women']
    Mouse Over    xpath = //a[text()='Women']
    Capture Page Screenshot

Clicar na sub categoria "Summer Dresses"
    Click Link    xpath = //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a
    Title Should Be    Summer Dresses - My Store
    Capture Page Screenshot

Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página
     Wait Until Element Is Visible    xpath = //div[text()='Short dress, long dress, silk dress, printed dress, you will find the perfect dress for summer.']
     Scroll Element Into View         xpath = //*[@id="center_column"]/ul/li[1]/div/div[2]/span/span
     Element Should Be Visible        xpath = //*[@id="center_column"]/ul/li[1]/div/div[2]/h5
     Page Should Contain Image        xpath = //*[@id="center_column"]//img[@src="http://automationpractice.com/img/p/1/2/12-home_default.jpg"]
     Mouse Over                       xpath = //*[@id="center_column"]/ul/li[2]/div/div[2]/h5
     Mouse Over                       xpath = //*[@id="center_column"]/ul/li[3]/div/div[2]/h5/a
     Capture Page Screenshot
# --- Fim do teste: Caso de Teste 03: Listar Produtos ---

# --- Inicio do teste: Caso de Teste 04: Adicionar Cliente ---
Clicar em "Sign in"
      Wait Until Element Is Visible    xpath = //*[@id="header_logo"]/a/img
      Click Element    xpath = //*[@id="header"]/div[2]/div/div/nav/div[1]/a

Informar um e-mail válido
      Wait Until Element Is Visible    xpath = //label[@for='email_create'][text()='Email address']
      Input Text    xpath = //*[@id="email_create"]    kaicofelipe@gmail.com

Clicar em "Create an Account"
      Click Button    xpath = //*[@id='SubmitCreate']

Preencher os Dados obrigatório
      Wait Until Element Is Visible    xpath = //h1[text()='Create an account']
      Click Element    xpath = //*[@id="id_gender2"]
      Capture Page Screenshot

      Input Text          name = customer_firstname    Kaico
      Input Text          name = customer_lastname     Felipe
      Input Password      name = passwd    Prime1234

      #--- Inserir Data de Nascimento ----
      Select From List By Value    name = days      20
      Select From List By Value    name = months    6
      Select From List By Value    name = years     1997


      Input Text    name = address1    Lincoln Road, 1021
      Input Text    name = city        New York

      Select From List By Value    name = id_state    32
      Input Text    name = postcode    33139
      Input Text    name = phone_mobile    11984171130

      Capture Page Screenshot

      Click Button    name = submitAccount

Conferir se o cadastro foi efetuado com sucesso       
      Wait Until Element Is Visible         xpath = //*[@id="center_column"]/h1       
      Capture Page Screenshot


# --- fim do teste: Caso de Teste 04: Adicionar Cliente ---
