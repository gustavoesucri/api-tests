*** Settings ***

Resource     ../base.robot

*** Keywords ***
Buscar todos os posts

    ${RESPONSE_GET_POSTS}=            GET
    ...                               url=${URL_PLACEHOLDER}/posts
    ...                               expected_status=200

    Log    ${RESPONSE_GET_POSTS.json()}        

Buscar post por ID

    ${RESPONSE_GET_POSTS_1}=          GET
    ...                               url=${URL_PLACEHOLDER}/posts/1
    ...                               expected_status=200

    Log    ${RESPONSE_GET_POSTS_1.json()}

    ${BODY}=     Set Variable       ${RESPONSE_GET_POSTS_1.json()}
    Should Be Equal As Integers     ${BODY}[id]    1

Criar post no placeholder
    [Arguments]        ${TITLE}    ${BODY}    ${ID_USER}    

    &{HEADERS}        Create Dictionary
    ...               Content-type=application/json

    ${BODY}           Format String    ${EXECDIR}/files/posts.json
    ...               title_aqui=${TITLE}
    ...               body_aqui=${BODY}
    ...               user_aqui=${ID_USER}

    ${RESPONSE_POST}        POST
    ...                     url=${URL_PLACEHOLDER}/posts
    ...                     headers=${HEADERS}
    ...                     data=${BODY}
    ...                     expected_status=201

    Log    ${RESPONSE_POST.json()}

Fazer uma alteracao em posts
    [Arguments]        ${TITLE}=""    ${BODY2}=""    ${ID_USER}=""   

    &{HEADERS}        Create Dictionary
    ...               Content-type=application/json

    ${BODY}           Format String    ${EXECDIR}/files/posts.json
    ...               title_aqui=${TITLE}
    ...               body_aqui=${BODY2}
    ...               user_aqui=${ID_USER}

    ${RESPONSE_PUT}        PUT
    ...                     url=${URL_PLACEHOLDER}/posts/${ID_USER}
    ...                     headers=${HEADERS}
    ...                     data=${BODY}
    ...                     expected_status=200

    Log    ${RESPONSE_PUT.json()}

Fazer uma alteracao em posts com menos argumentos
    [Arguments]            ${BODY_CONTEUDO}=""    ${ID_USER}=""   

    &{HEADERS}        Create Dictionary
    ...               Content-type=application/json

    ${BODY}           Format String    ${EXECDIR}/files/put.json
    #...               title_aqui=${TITLE}
    ...               body_aqui=${BODY_CONTEUDO}
    ...               user_aqui=${ID_USER}

    ${RESPONSE_PUT}        PUT
    ...                     url=${URL_PLACEHOLDER}/posts/${ID_USER}
    ...                     headers=${HEADERS}
    ...                     data=${BODY}
    ...                     expected_status=200

    Log    ${RESPONSE_PUT.json()}
