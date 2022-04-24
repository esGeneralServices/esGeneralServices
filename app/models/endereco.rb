class Endereco < ApplicationRecord

  validates_format_of :cep, presence: true, with: /\A\d{5}-\d{3}\z/, message: "Cep no formato: 0000-000"
  validates :cidade, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-z ]+\z/, message: "Utilize apenas letras"}
  validates :bairro, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-z ]+\z/, message: "Utilize apenas letras"}
  validates :logradouro, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-z0-9 ]+\z/, message: "Utilize apenas letras e números"}
  validates :complemento, presence: true, length: {in: 0..30}, format: {with: /\A[a-zA-z0-9 ]+\z/, message: "Utilize apenas letras e números"}

end
