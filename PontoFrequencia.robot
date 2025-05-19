*** Settings ***
Library           SeleniumLibrary
Library           XML
Library           OperatingSystem
Library           Collections
# FakerLibrary -> gera elementos fakes

*** Variables ***
${Campo_email}           //*[@id="identifierId"]
${email}                 ***
${avançar}               //*[@id="identifierNext"]/div/button
${campo_senha}           //*[@name="Passwd"]
${senha}                 ***
${avançar2}              //*[@id="passwordNext"]/div/button

${campo_nome}            //*[@jsname="LgbsSe"]
${nome}                  //*[@role="option" and @class="MocG8c HZ3kWc mhLiyf OIC90c LMgvRb"]
${horário}               //*[@name="entry.663912831_sentinel"]/..//*[@class="nWQGrd zwllIb"]
${área}                  //*[@name="entry.20473036_sentinel"]/..//*[@class="nWQGrd zwllIb"]
${projeto}               //*[@class="Y6Myld"]/..//*[@class="eBFwI"]

${campo_atividade}       //*[@class="KHxj8b tL9Q4c"]
${atividade}             preenchendo formulário
${enviar}                //*[@class="uArJ5e UQuaGc Y5sE8d VkkpIf QvWxOd"]


*** Keywords ***
Acessar Formulário
    Open Browser        ***    chrome
    Maximize Browser Window

Login google
    Input Text          ${Campo_email}       ${email}
    Wait Until Element Is Visible    ${avançar}
    Click Element       ${avançar}
    Wait Until Element Is Visible    ${campo_senha}
    Input Text          ${campo_senha}       ${senha}
    Wait Until Element Is Visible    ${avançar2}
    Click Element       ${avançar2}

Selecionar Opção Aleatória
    [Arguments]    ${opções}
    Wait Until Element Is Visible    ${opções}
    #contador
    ${total}=     Get Element Count   ${opções}
    ${índice}=    Evaluate    random.randint(1, ${total}-1)    modules=random
    #barra invertida pra n dar erro no array
    Wait Until Element Is Visible    ${opções}\[${índice}]
    Click Element    ${opções}\[${índice}]

Preenchendo formulário
    # Nome # perceber a diferença entre campos "iguais"
    Wait Until Element Is Visible    ${campo_nome}
    Click Element    ${campo_nome}
    Selecionar Opção Aleatória    ${nome}

    # Horário
    Selecionar Opção Aleatória    ${horário}

    # Área
    Selecionar Opção Aleatória    ${área}

    # Projeto Trabalhado
    Selecionar Opção Aleatória    ${projeto}

    # Atividade
    Wait Until Element Is Visible    ${campo_atividade}
    Input Text    ${campo_atividade}    ${atividade}

Enviar
    Wait Until Element Is Visible    ${enviar}
    Click Element    ${enviar}
    Close Browser

*** Test Cases ***
Cenário1: Preenchendo Ponto de Frequência
    Acessar Formulário
    Login google
    Preenchendo formulário
    Enviar
