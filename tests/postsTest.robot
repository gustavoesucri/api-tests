*** Settings ***
Resource    ../resources/base.robot

*** Test Cases ***

Buscar Lista de posts
    [Tags]    Buscar_Lista

    Buscar todos os posts
    Buscar post por ID

Criar posts no site do placeholder
    [Tags]    Criar_Posts
    Criar post no placeholder