Feature: Admin
  As an Administrador,
  I want to visualizar e remover as contas dos usuários Cliente e Trabalhador
  So that eu possa manter o sistema atualizado

  Scenario: Visualizar cliente
    Given o cliente com nome 'teste', cpf '70369935454', email 'cliente@email.com' e senha '123456' existe
    And eu estou na tela de admin com nome 'admin', email 'admin@admin.com' e senha '123456'
    When clico em Mostrar clientes
    Then eu vejo todos os clientes cadastrados

  Scenario: Visualizar trabalhador
    And o trabalhador com nome 'teste2', cpf '70369935454', profissao 'agricultor', email 'trabalhador@email.com' e senha '123456' existe
    And eu estou na tela de admin com nome 'admin', email 'admin@admin.com' e senha '123456'
    When clico em Mostrar trabalhadores
    Then eu vejo todos os trabalhadores cadastrados

  Scenario: Remover cliente
    Given o cliente com nome 'teste', cpf '70369935454', email 'cliente@email.com' e senha '123456' existe
    And eu estou na tela de admin com nome 'admin', email 'admin@admin.com' e senha '123456'
    When clico em Mostrar clientes
    And clico em excluir o cliente com nome 'teste'
    Then os dados do cliente 'teste' sao apagados

  Scenario: Remover trabalhador
    Given o trabalhador com nome 'teste2', cpf '70369935454', profissao 'agricultor', email 'trabalhador@email.com' e senha '123456' existe
    And eu estou na tela de admin com nome 'admin', email 'admin@admin.com' e senha '123456'
    When clico em Mostrar trabalhadores
    And clico em excluir o trabalhador com nome 'teste2'
    Then os dados do trabalhador 'teste2' sao apagados

  Scenario: Remover admin
    Given eu estou na tela de admin com nome 'admin', email 'admin@admin.com' e senha '123456'
    When clico para visualizar minha conta
    And clico para excluir minha conta
    Then a mensagem 'Bye! Your account has been successfully cancelled. We hope to see you again soon.' eh exibida