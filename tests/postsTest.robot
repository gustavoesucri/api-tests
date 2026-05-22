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
    ...    Título do livro     
    ...    Corpo do livro    
    ...    10

Alteracao em posts no site do placeholder
    [Tags]    Editar_Posts
    Fazer uma alteracao em posts    Título do livro    Corpo Editado    1
    Fazer uma alteracao em posts com menos argumentos    Corpo put    2