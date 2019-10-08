Instruções para executar os testes:

- Executar comando na pasta do projeto: rails db:environment:set RAILS_ENV=test

- Para rodar os testes: rails test

Teste Rspec

- Ir no arquivo "nome_do_projeto >> spec >> spec_helper.rb" e mudar a variavel "base_uri" para o host respectivo que está rodando a aplicação

- Subir aplicação antes de efetuar o teste Rspec

- Para rodar o teste executar comando(na pasta do projeto) : bundle exec rspec