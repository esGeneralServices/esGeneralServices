Feature: Servico
  As a trabalhador
  I want to cadastrar, visualizar, atualizar e remover meus servicos prestados
  So that eu possa atender as pessoas e ganhar um salario

  Scenario: Cadastrar um novo servico
    Given O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    And Eu estou na tela de cadastrar um novo servico
    When Eu crio um servico com nome 'faxina', descricao 'Servico de faxina para sua residencia', valor '50.00', horarioInicio '2000-01-01 12:00:00 UTC', horarioTermino '2000-01-01 14:00:00 UTC', data '22-07-23'
    Then Eu vejo uma mensagem que o serviço de nome 'faxina' foi criado

  Scenario: Criar um servico com nome invalido
    Given O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    And Eu estou na tela de cadastrar um novo servico
    When Eu crio um servico com nome '', descricao 'Servico de faxina para sua residencia', valor '50.00', horarioInicio '2000-01-01 12:00:00 UTC', horarioTermino '2000-01-01 14:00:00 UTC', data '22-07-23'
    Then Eu vejo uma mensagem de erro de nome vazio

  Scenario: Criar um servico com valor invalido
    Given O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    And Eu estou na tela de cadastrar um novo servico
    When Eu crio um servico com nome 'faxina', descricao 'Servico de faxina para sua residencia', valor 'vinte', horarioInicio '2000-01-01 12:00:00 UTC', horarioTermino '2000-01-01 14:00:00 UTC', data '22-07-23'
    Then Eu vejo uma mensagem de erro de valor invalido

  Scenario: Vizualizar servicos
    Given Eu estou na pagina home
    And O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    When Eu clico para visualizar meus servicos
    Then Eu vejo todos os meus servicos na tela