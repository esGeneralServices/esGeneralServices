require 'cpf_cnpj'
class Trabalhador < ApplicationRecord
  validates :nomeCompleto, presence: true, length: {minimum: 3}
  validates :dataNasc, presence: true
  validates :cpf, presence: true
  validate :validacao_cpf
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, length: {minimum: 5}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  validate :validarDataNasc

  def validarDataNasc
    if dataNasc.present? && dataNasc > Time.zone.today
      errors.add(:dataNasc, "Não é possível adicionar essa data como data de nascimento")
    end
  end

  def validacao_cpf
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "Utilize um cpf válido")
    end
  end
end
