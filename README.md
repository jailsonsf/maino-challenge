# Mainô Challenge

Desafio Mainô - Aplicação web Ruby on Rails, com autenticação de usuário para upload de documentos e processamento em background.

**Principais tecnologias usadas**:
* Ruby 3.3.4 e Ruby on Rails 7.1.3
* PostgreSQL
* Redis
* Sidekiq
* RSpec

## Instalação

### Clone o repositório
```shell
git clone git@github.com:jailsonsf/maino-challenge.git
cd maino-challenge
```

Como nesse projeto o ambiente de desenvolvimento foi feito usando docker, podemos iniciar a aplicação com o docker compose:
```shell
docker compose up --build
```

Em outro terminal, vamos executar as migrações:
```shell
docker compose run web rails db:migrate
```

Ao terminar de executar a aplicação podemos terminar a execução dos containers
```shell
docker compose down
```
