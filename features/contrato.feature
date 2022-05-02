Feature: Contrato
  As a cliente
  I want to visualizar e contratar servicos disponiveis
  So that eu possa realizar consertos em meus patrimonios

  Scenario: Contratar um servico
    Given O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    And o servico com nome 'Teste', descricao 'teste', valor '150.00', horario de inicio '2000-01-01 08:30:00 UTC', horario de termino '2000-01-01 09:30:00 UTC' e data '2022-12-30' existe
    And o trabalhador com nome 'Fabio' esta deslogado
    And Estou na pagina de cadastrar cliente
    And o cliente de nome 'Jurandir' cpf '007.587.974-35' email 'jsmelo1@gmail.com' password '123456' confirma password '123456' existe
    And eu estou na pagina para contratar servicos
    When eu clico para contratar o servico com nome 'Teste'
    Then eu recebo a confirmacao de que o servico com nome 'Teste' foi contratado

  Scenario: Editar um contrato
    Given O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    And o servico com nome 'Teste', descricao 'teste', valor '150.00', horario de inicio '2000-01-01 08:30:00 UTC', horario de termino '2000-01-01 09:30:00 UTC' e data '2022-12-30' existe
    And o servico com nome 'TesteDois', descricao 'testedois', valor '100.00', horario de inicio '2000-01-01 12:30:00 UTC', horario de termino '2000-01-01 14:30:00 UTC' e data '2022-12-30' existe
    And o trabalhador com nome 'Fabio' esta deslogado
    And Estou na pagina de cadastrar cliente
    And o cliente de nome 'Jurandir' cpf '007.587.974-35' email 'jsmelo1@gmail.com' password '123456' confirma password '123456' existe
    And eu estou na pagina para contratar servicos
    And eu clico para contratar o servico com nome 'Teste'
    And eu recebo a confirmacao de que o servico com nome 'Teste' foi contratado
    And eu clico para visualizar os servicos contratados
    And eu estou na pagina do servico com nome 'Teste' contratado
    When eu mudo o servico contratado para 'TesteDois'
    Then eu recebo a confirmacao de que o servico foi editado

  Scenario: Remover um servico contratado
    Given O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    And o servico com nome 'Teste', descricao 'teste', valor '150.00', horario de inicio '2000-01-01 08:30:00 UTC', horario de termino '2000-01-01 09:30:00 UTC' e data '2022-12-30' existe
    And o trabalhador com nome 'Fabio' esta deslogado
    And Estou na pagina de cadastrar cliente
    And o cliente de nome 'Jurandir' cpf '007.587.974-35' email 'jsmelo1@gmail.com' password '123456' confirma password '123456' existe
    And eu estou na pagina para contratar servicos
    And eu clico para contratar o servico com nome 'Teste'
    And eu recebo a confirmacao de que o servico com nome 'Teste' foi contratado
    And eu clico para visualizar os servicos contratados
    And eu estou na pagina do servico com nome 'Teste' contratado
    When eu clico para remover o servico contratado com nome 'Teste'
    Then eu volto para a pagina inicial

  Scenario: Contratar um servico inexistente
    Given O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    And o trabalhador com nome 'Fabio' esta deslogado
    And Estou na pagina de cadastrar cliente
    And o cliente de nome 'Jurandir' cpf '007.587.974-35' email 'jsmelo1@gmail.com' password '123456' confirma password '123456' existe
    And eu estou na pagina para contratar servicos
    When eu clico para contratar um servico
    Then eu vejo que o contrato foi criado com o servico 'MyString'

  Scenario: Visualizar um servico contratado
    Given O trabalhador com nome 'Fabio', cpf '12024681441', profissao 'zelador', email 'fabio@gmail.com', password '123456', password_confirmation '123456' existe
    And o servico com nome 'Teste', descricao 'teste', valor '150.00', horario de inicio '2000-01-01 08:30:00 UTC', horario de termino '2000-01-01 09:30:00 UTC' e data '2022-12-30' existe
    And o trabalhador com nome 'Fabio' esta deslogado
    And Estou na pagina de cadastrar cliente
    And o cliente de nome 'Jurandir' cpf '007.587.974-35' email 'jsmelo1@gmail.com' password '123456' confirma password '123456' existe
    And eu estou na pagina inicial do cliente 'Jurandir'
    When eu clico para visualizar os servicos contratados
    Then eu vejo uma nova pagina com todos os servicos que contratei