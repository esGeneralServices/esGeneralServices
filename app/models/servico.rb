class Servico < ApplicationRecord
  has_one :endereco, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nomeServico, presence: true, length: {in: 3..20}, format: {with: /\A[a-zA-z ]+\z/, message: "Utilize penas letras"}
  validates :tipoServico, presence: true, length: {in: 3..20}, format: {with: /\A[a-zA-z ]+\z/, message: "Utilize apenas letras"}
  validates :horaInicio, presence: true, time: true, message: "Utilize a hora no formato XX:XXam ou XX:XXpm"
  validates :horaFinal, presence: true, time: true, message: "Utilize a hora no formato XX:XXam ou XX:XXpm"
  validates :descricaoServico, presence: true, length: {in: 3..150}, format: {with: /\A[a-zA-z0-9]+\z/, message: "Utilieze apenas letras e números"}
  validates :valorServico, presence: true, length: {in: 4..20}, format: {with: /\A[0-9]-\d{2}\z/, message: "Utilize o valor no formato X.XX"}
  validate :validacao_dataServico
  validate :validacao_horaInicio

  def validacao_dataServico
    if dataServico.present? && dataServico < Date.today
      errors.add(:data, "Data de execução do serviço menor que a data atual!")
    end
  end

  def validacao_horaInicio
    if (dataServico.present? && (dataServico == Date.today)) && (horaInicio.present? && (horaInicio <= Time.now.hour))
      errors.add(:time, "A hora inicial de execução do serviço é menor ou igual a hora a atual!")
    end
  end
end
