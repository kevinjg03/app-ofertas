class ListaDetalle < ApplicationRecord
  belongs_to :lista_compra
  belongs_to :producto
  
  validates :cantidad, presence: true, numericality: { greater_than: 0 }
  validates :prioridad, presence: true, numericality: { greater_than: 0 }
end
