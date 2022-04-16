json.extract! cliente, :id, :nomeCompleto, :dataNasc, :cpf, :email, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
