@echo off
echo Configurando projeto para GitHub...

REM Remove repositorios Git existentes
if exist .git rmdir /s /q .git
if exist dish_of_the_world\.git rmdir /s /q dish_of_the_world\.git

REM Inicializa novo repositorio
git init --initial-branch=main

REM Configura usuario (substitua pelos seus dados)
git config user.name "Seu Nome"
git config user.email "seu.email@exemplo.com"

REM Adiciona arquivos
git add .gitignore
git add README.md
git add backend/
git add dish_of_the_world/
git add frontend/
git add dish.sql

REM Primeiro commit
git commit -m "Initial commit - Sistema de Encomendas TCC"

echo.
echo Repositorio Git criado com sucesso!
echo.
echo Proximos passos:
echo 1. Crie um repositorio no GitHub
echo 2. Execute: git remote add origin https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git
echo 3. Execute: git push -u origin main
echo.
pause