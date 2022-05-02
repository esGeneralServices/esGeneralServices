class Contrato < ApplicationRecord
  belongs_to :servico
  belongs_to :cliente
end
