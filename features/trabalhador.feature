Feature: Trabalhador
  As a Trabalhador
  I want to me cadastrar, visualizar, atualizar e remover meus dados no sistema
  So that eu possa ter acesso às funcionalidades do mesmo ou me retirar

  Scenario: Criar um novo trabalhador
    Given Eu estou na pagina de cadastrar novo trabalhador
    When Eu crio um trabalhador com nomeCompleto 'Fabio', dataNasc '2001-05-12', cpf '12024681441', email 'fabio@gmail.com'
    Then Eu vejo uma mensagem que o paciente foi criado com sucesso

  Scenario: Deletar um trabalhador existente
    Given Eu estou na pagina de cadastrar novo trabalhador
    When Eu crio um trabalhador com nomeCompleto 'Fabio', dataNasc '2001-05-12', cpf '12024681441', email 'fabio@gmail.com'
    And Eu clico em deletar trabalhador
    Then Eu vejo uma mensagem que o trabalhador foi deletado com sucesso