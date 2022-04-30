class Servico < ApplicationRecord
  belongs_to :trabalhador

  validates :nome, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}
  validates :descricao, presence: true, length: {in: 1..150}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}
  validates :valor, presence: true, length: {in: 1..100}, format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: "Use apenas numeros e ponto"}
  validates :horarioTermino, presence: true
  validates :horarioInicio, presence: true
  validates :data, presence: true
  validate :horarioI
  validate :horarioT
  validate :data_valida


  def horarioI
    if horarioInicio.present? && horarioInicio < Time.now
      errors.add(:horarioInicio, " nao pode ser um horario no passado")
    end
  end

  def horarioT
    if horarioTermino.present? && horarioTermino < horarioInicio
      errors.add(:horarioTermino, " horario de servico invalido")
    end
  end

  def data_valida
    if data.present? && data < Time.zone.today
      errors.add(:data, " não pode ser uma data no passado")
    end
  end
end
