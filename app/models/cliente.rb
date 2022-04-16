require 'cpf_cnpj'

class Cliente < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :nomeCompleto, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-z ]+\z/, message: "Apenas Letras"}
  validate :validacao_dataNascimento
  validates :cpf, presence: true, uniqueness: true
  validate :validacao_cpf
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX, on: :create}, uniqueness: {case_sensitive: false}

  def validacao_dataNascimento
    if dataNasc.present? && dataNasc> Date.today
      errors.add(:data, "Data de nascimento maior ou igual a data atual!")
    end
  end

  def validacao_cpf
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, " Invalido. Utilize um CPF válido ou verifique se o mesmo está no formato: 000000000-00")
    end
  end

end
