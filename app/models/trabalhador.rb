class Trabalhador < ApplicationRecord

  has_many :servicos, dependent: :destroy
  has_many :contratoes, through: :servicos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nome, presence: true, length: {in: 3..40}
  validates :cpf, presence: true
  validate :cpf_valida
  validates :profissao, presence: true, length: {in: 3..40}

  def cpf_valida
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "Formato: XXX.XXX.XXX-XX")
    end
  end
end
