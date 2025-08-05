class EstadoRegistro < ApplicationRecord
  has_many :registro_precios
  
  validates :name, presence: true, uniqueness: true
end 