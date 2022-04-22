class Servico < ApplicationRecord

  validates :nome, presence: true, length: {in: 3..20}, format: {with: /\A[a-zA-z ]+\z/, message: "Utilize penas letras"}
  validates :tipo, presence: true, length: {in: 3..20}, format: {with: /\A[a-zA-z ]+\z/, message: "Utilize apenas letras"}
  validates :horaInicio, presence: true, time: true, message: "Utilize a hora no formato XX:XXam ou XX:XXpm"
  validates :horaFinal, presence: true, time: true, message: "Utilize a hora no formato XX:XXam ou XX:XXpm"
  validates :descricao, presence: true, length: {in: 3..150}, format: {with: /\A[a-zA-z0-9]+\z/, message: "Utilieze apenas letras e números"}
  validates :valor, presence: true, length: {in: 4..20}, format: {with: /\A[0-9]-\d{2}\z/, message: "Utilize o valor no formato X.XX"}

end