class RegistroPrecio < ApplicationRecord
  belongs_to :estado_registro
  belongs_to :producto
  belongs_to :comercio
  belongs_to :usuario
  
  validates :precio, presence: true, numericality: { greater_than: 0 }
  validates :moneda, presence: true
  validates :fecha_registro, presence: true
end
