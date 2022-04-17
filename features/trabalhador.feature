Feature: Trabalhador
  As a trabalhador
  I want to criar, remover, visualizar e editar meu cadastro
  So that eu nao tenha que fazer isso de forma manual

  Scenario: Criar um novo trabalhador
    Given Eu estou na pagina de cadastrar novo trabalhador
    When Eu crio um trabalhador com nomeCompleto 'Fabio', dataNasc '2001-05-12', cpf '12024681441', email 'fabio@gmail.com'
    Then Eu vejo uma mensagem que o paciente foi criado com sucesso

  Scenario: Deletar um trabalhador existente
    Given Eu estou na pagina de cadastrar novo trabalhador
    When Eu crio um trabalhador com nomeCompleto 'Fabio', dataNasc '2001-05-12', cpf '12024681441', email 'fabio@gmail.com'
    And Eu clico em deletar trabalhador
    Then Eu vejo uma mensagem que o trabalhador foi deletado com sucesso