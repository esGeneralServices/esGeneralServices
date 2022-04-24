json.extract! servico, :id, :nomeServico, :tipoServico, :dataServico, :horaInicio, :horaFinal, :descricaoServico, :valorServico, :endereco_id, :created_at, :updated_at
json.url servico_url(servico, format: :json)
