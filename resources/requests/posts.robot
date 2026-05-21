*** Settings ***

Resource     ../base.robot

*** Keywords ***
Buscar todos os posts

    ${RESPONSE_GET_POSTS}=    GET
    ...                       url=${URL_PLACEHOLDER}/posts
    ...                       expected_status=200

    Log    ${RESPONSE_GET_POSTS.json()}        