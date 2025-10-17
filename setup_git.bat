@echo off
echo Configurando Git para o projeto dishTcc...

:: Configurar usuario e email do Git
git config --global user.name "joaogabriell10"
git config --global user.email "jg521691@gmail.com"

:: Inicializar repositorio Git se nao existir
if not exist .git (
    git init
    echo Repositorio Git inicializado.
)

:: Adicionar todos os arquivos
git add .

:: Fazer commit inicial
git commit -m "Initial commit - Sistema de Encomendas TCC"

:: Adicionar repositorio remoto (substitua pela URL do seu repositorio)
echo.
echo IMPORTANTE: Crie um repositorio no GitHub chamado 'dishTcc' primeiro!
echo Depois execute: git remote add origin https://github.com/joaogabriell10/dishTcc.git
echo.

:: Fazer push para o GitHub
echo Para fazer o push, execute:
echo git branch -M main
echo git push -u origin main

pause