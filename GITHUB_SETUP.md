# Como subir o projeto no GitHub

## Passo 1: Preparar o repositório local

1. Abra o terminal/prompt de comando na pasta do projeto
2. Execute o script: `setup_github.bat`
3. Ou execute manualmente os comandos:

```bash
# Remove repositórios Git existentes (se houver)
rmdir /s /q .git
rmdir /s /q dish_of_the_world\.git

# Inicializa novo repositório
git init --initial-branch=main

# Configura suas informações (SUBSTITUA pelos seus dados)
git config user.name "Seu Nome Completo"
git config user.email "seu.email@gmail.com"

# Adiciona arquivos
git add .
git commit -m "Initial commit - Sistema de Encomendas TCC"
```

## Passo 2: Criar repositório no GitHub

1. Acesse [GitHub.com](https://github.com)
2. Clique em "New repository" (botão verde)
3. Nome sugerido: `sistema-encomendas-tcc`
4. Descrição: "Sistema completo de encomendas com Spring Boot, Flutter e SQL Server"
5. Deixe como **público** ou **privado** (sua escolha)
6. **NÃO** marque "Add a README file" (já temos um)
7. Clique em "Create repository"

## Passo 3: Conectar e enviar código

Após criar o repositório, execute no terminal:

```bash
# Conecta ao repositório remoto (SUBSTITUA pela sua URL)
git remote add origin https://github.com/SEU_USUARIO/sistema-encomendas-tcc.git

# Envia o código para o GitHub
git push -u origin main
```

## Exemplo completo

Se seu usuário GitHub for `joaosilva`, os comandos seriam:

```bash
git remote add origin https://github.com/joaosilva/sistema-encomendas-tcc.git
git push -u origin main
```

## Estrutura que será enviada

```
sistema-encomendas-tcc/
├── backend/          # API Spring Boot
├── dish_of_the_world/ # App Flutter
├── frontend/         # Frontend web (se aplicável)
├── dish.sql         # Script do banco
├── README.md        # Documentação
└── .gitignore       # Arquivos ignorados
```

## Próximos commits

Para futuras alterações:

```bash
git add .
git commit -m "Descrição da alteração"
git push
```