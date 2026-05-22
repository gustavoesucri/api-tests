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

    &{HEADERS}        Create Dictionary
    ...               Content-type=application/json

    ${BODY}           Format String    ${EXECDIR}/files/posts.json
    ...               title_aqui=Título do Livro Ausente
    ...               body_aqui=Qualquer conteúdo do livro
    ...               user_aqui=10

    ${RESPONSE_POST}        POST
    ...                     url=${URL_PLACEHOLDER}/posts
    ...                     headers=${HEADERS}
    ...                     data=${BODY}
    ...                     expected_status=201

    Log    ${RESPONSE_POST.json()}
