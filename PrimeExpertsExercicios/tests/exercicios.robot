*** Settings ***
Documentation        Neste arquivo estarão presentes todos os exercicios de atuomação do curso prime Prime Hero

*** Variables ***
# Minha primeira variavel do tipo dicionario 
&{PESSOA}            
...    nome=Kaico     
...    sobrenome=Castro    
...    idade=24 anos    
...    cpf=44678602829    
...    profissao=auxiliar de logistica     
...    carro=Fit

@{FRUTAS}    Banana     Abacaxi     Limão    Jabuticaba

*** Test Cases ***
Cenario: Imprimindo 6 informações de uma pessoa
    Log To Console    ${PESSOA.nome}
    Log To Console    ${PESSOA.sobrenome}
    Log To Console    ${PESSOA.idade}
    Log To Console    ${PESSOA.cpf}
    Log To Console    ${PESSOA.carro}

Cenario: Imprimindo uma lista de frutas

    [Tags]                LISTA
    Log To Console        ${FRUTAS}
    Log To Console        ${FRUTAS[0]}
    Log To Console        ${FRUTAS[3]}

Cenario: Somando dois numeros
    [Tags]                SOMAR
    Somar dois numeros   10    10
Cenario: Contando de 0 a 9
    [Tags]    CONTAR     
    FOR    ${COUNT}    IN RANGE    0    9
        Log To Console    ${COUNT}
    END        
            
Cenario: Percorrendo uma lista de frutas
    [Tags]                FRUTAS   
    Percorrer itens de uma lista

Cenario: Tomar decisões
    [Tags]        NUM
    Tomar decisões

           
*** Keywords ***
Somar dois numeros
    [Arguments]    ${NUM_a}    ${NUM_B}    
    ${SOMA}        Evaluate    ${NUM_A}+${NUM_B}
    [Return]       ${SOMA}      

Somar os numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}        Evaluate    ${NUM_A}+${NUM_B}
    [Return]       ${SOMA}

Criando Email
    [Arguments]        ${PESSOA.nome}    ${PESSOA.sobrenome}    ${PESSOA.idade}    
    ${EMAIL}    Evaluate        ${PESSOA.nome}_${PESSOA.sobrenome}_${PESSOA.idade}@robot.com
        Log To Console    ${EMAIL}
    [Return]    ${EMAIL}
    
Contar de 0 a 9
    FOR    ${COUNT}    IN RANGE     0 9 
        Log To Console    ${COUNT}
    END            

Percorrer itens de uma lista    
    @{FRUTAS}    Create List    Banana    Abacaxi    Limão
    FOR    ${FRUTAS}    IN    @{FRUTAS}
        Log To Console        ${FRUTAS}
    END     

Numero de 0 a 10
    FOR    ${COUNT}    IN RANGE    0    10   
        Log To Console    Estou no numero ${COUNT}
    
    END

Nome de paises
    @{PAISES}    Create List    Brasil    México    Holanda
    FOR    ${PAIS}    IN    @{PAISES}
        Log To Console    Estou no pais ${PAIS}
    END     

          
Tomar decisões
    FOR    ${COUNT}    IN RANGE    0    9
        IF    '${COUNT}'=='5'
            Log To Console   Estou no numero ${COUNT}
        ELSE IF    '${COUNT}'=='8'
            Log To Console   Estou no numero ${COUNT}
        ELSE
            Log To Console   Este não é o número 5 ou o número 8
        END
    END