# Desconto INNS
Aplicação Rails para cadastro de funcionários, calculos de desconto de INSS e relatório.

### Estrutura do Projeto:
Além da estrutura padrão Rails, mais alguns diretórios foram adicionados:
* `app/sidekiq`: Reponsável por lidar com tarefas que rodam no background;
* `app/services`: Irá conter classes para realizar determinadas tarefas;
* `app/reports`: Contém a lógica dos relatórios;

### Dependências do Projeto:
* `redis`
* `postgresql`
* `docker`
* Há um `docker-compose.yml`que irá se responsabilizar em criar um container com o `Postgresql`e o `Redis`
* `ruby 3.3.1` (precisa estar instalado na máquina)
* `rails 7.2.1` (precisa estar instalado na máquina)

## Uso
Para executar a aplicação (após ter feito clone do repositório):
```
$ cd desconto-inss
```
Execute o bundler:
```
$ bundle install
```
Há um Procfile.dev contendo as dependências que o projeto precisa a também ele irá inicializar o servidor. Como o postgres rodará dentro de um container docker, e o docker-compose está sendo executado dentro do Procfile, primeiro precisamos rodar: (certifique-se que há permissão de execução para o arquivo `bin/dev`)
```
$ bin/dev
```
para depois rodar as migrações:
```
$ rake db:setup
```
O banco de dados será criado e os seeds serão executados, populando nosso banco.
```
http://localhost:3000
```
A app deverá estar em funcionamento nessa URL.

#### Autenticação:
Você será apresentado com uma tela de login, segue as credenciais:
E-mail: `admin@email.com`
Senha: `secret`


## Testes
Para rodar os testes:
```
$ rspec
```