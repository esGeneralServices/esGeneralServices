Feature: Trabalhador
  As a trabalhador
  I want to me cadastrar, visualizar, atualizar e remover meus dados no sistema
  So that eu possa ter acesso às funcionalidades do mesmo ou me retirar

  Scenario: Criar um novo trabalhador
    Given Eu estou na pagina de cadastrar novo trabalhador
    When Eu crio um trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456'
    Then Eu vejo uma mensagem que o trabalhador 'Fabio' foi gerado

  Scenario: Deletar um trabalhador
    Given Eu estou na pagina de trabalhador
    And O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    When Eu clico para cancelar minha conta
    Then Eu vejo uma mensagem que o trablhador foi excluido

  Scenario: Criar um trabalhador com campo invalido
    Given Eu estou na pagina de cadastrar novo trabalhador
    When Eu crio um trabalhador com nome 'Fabio', cpf 'ssddaaaadad', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456'
    Then Eu vejo uma mensagem de erro

  Scenario: Editar nome trabalhador
    Given Eu estou na pagina home
    And O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    When Eu clico para editar minha conta com nome 'Fabio'
    And Altero o nome para 'freire' com a senha '123456'
    Then Eu vejo uma mensagem de cadastro atualizado

  Scenario: Editar email trabalhador
    Given Eu estou na pagina home
    And O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    When Eu clico para editar minha conta com nome 'Fabio'
    And Altero o email para 'fabinho@gmail.com' com a senha '123456'
    Then Eu vejo uma mensagem de cadastro atualizado
