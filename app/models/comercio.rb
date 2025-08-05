class Comercio < ApplicationRecord
  has_many :registro_precios, dependent: :destroy

  has_one :categoria, class_name: 'Categoria', foreign_key: 'id'
  
  
  validates :nombre, presence: true
  validates :direccion, presence: true
end
