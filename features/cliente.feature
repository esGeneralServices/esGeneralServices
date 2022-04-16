Feature: Cliente
  As a cliente
  I want to adicionar, remover, visualizar e editar o meu cadastro
  so that eu não precise de um admin para executar estas ações

  Scenario: cadastrar cliente
    Given estou na view para cadastrar paciente
    When eu preencho o formulário com nomeCompleto 'Jurandir Melo' a dataNascimento '1981-10-11' o cpf 'XXXXXXXXX-XX' o email 'jsmelo1@gmail.com'
    Then eu clico em Create Cliente e em seguida vejo uma mensagem informando que o cliente foi cadastrado com sucesso
