class ListaCompra < ApplicationRecord
  belongs_to :usuario
  has_many :lista_detalles, dependent: :destroy
  has_many :productos, through: :lista_detalles
  
  validates :nombre, presence: true
  validates :fecha_creacion, presence: true
end
