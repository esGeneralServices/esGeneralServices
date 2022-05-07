require 'cpf_cnpj'

class Cliente < ApplicationRecord
  has_many :contratoes
  has_many :servicos, through: :contratoes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nome, presence: true, length: {in: 3..40}
  validates :cpf, presence: true
  validate :cpf_valida

  validates :cep, presence: true, format: {with: /\A\d{5}-\d{3}\z/, message: "Cep no formato: 0000-000"}
  validates :cidade, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-z ]+\z/, message: "Utilize apenas letras"}
  validates :bairro, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-z ]+\z/, message: "Utilize apenas letras"}
  validates :logradouro, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-z0-9 ]+\z/, message: "Utilize apenas letras e números"}
  validates :complemento, presence: true, length: {in: 0..30}, format: {with: /\A[a-zA-z0-9 ]+\z/, message: "Utilize apenas letras e números"}

  def cpf_valida
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "Formato: XXX.XXX.XXX-XX")
    end
  end

end
