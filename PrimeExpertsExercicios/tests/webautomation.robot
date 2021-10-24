*** Settings ***
Resource           ../resource/Resource.robot
Test Setup         Abrir navegador
Test Teardown      Fechar navegador


### SETUP ele roda a keyword antes da suite ou antes de um Teste
### TEARDOWN ele roda a keyword depois da suite ou um Teste

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]    EXISTENTE
    Acessar a pagina home do site
    Digite o nome do produto "Blouse" no campo de Pesquisar
    Clicar no botão Pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não existente
    [Tags]      NAOEXISTENTE
    Acessar a pagina home do site
    Digite o nome do produto "ItemNãoExistente" no campo de Pesquisar
    Clicar no botão Pesquisar
    Conferir mensagem de erro "No results were found for your search&nbsp;"Item inexistente""

Caso de Teste 03: Listar Produtos
    [Tags]      LISTAR
    Acessar a pagina home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"
    Conferir se os produtos da sub-categoria "Summer Dresses" foram mostrados na página

Caso de Teste 04: Adicionar Cliente
    [Tags]      ADICIONAR
    Acessar a pagina home do site
    Clicar em "Sign in"
    Informar um e-mail válido
    Clicar em "Create an Account"
    Preencher os Dados obrigatório
    Conferir se o cadastro foi efetuado com sucesso
