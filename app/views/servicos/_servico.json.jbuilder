json.extract! servico, :id, :nome, :tipo, :horaInicio, :horaFinal, :descricao, :valor, :created_at, :updated_at
json.url servico_url(servico, format: :json)
