require 'cpf_cnpj'

class Cliente < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nome, presence: true, length: {in: 3..40}
  validate :cpf_valida


  def cpf_valida
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "Formato: XXX.XXX.XXX-XX")
    end
  end
end
