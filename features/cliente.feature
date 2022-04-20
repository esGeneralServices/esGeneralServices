Feature:
  As a cliente
  I want to criar, editar, remover e visualizar meu cadastro
  So that possa manter atualizado meu cadastro

  Scenario: cadastrar cliente
    Given Estou na pagina de cadastrar cliente
    When eu preencho os dados nome 'Jurandir' cpf '007.587.974-35' email 'jsmelo1@gmail.com' password '123456' confirma password '123456'
    Then vejo que o meu cadastro foi efetuado

  Scenario: remover cliente
    Given Estou na pagina de cliente
    And o cliente de nome 'Jurandir' cpf '007.587.974-35' email 'jsmelo1@gmail.com' password '123456' confirma password '123456' existe
    When eu clico para remover o cliente de nome 'Jurandir'
    Then vejo que o cliente foi corretamente removido