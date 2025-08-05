class Categoria < ApplicationRecord
  self.table_name = 'categoria'
  
  has_many :productos, dependent: :destroy
  
  validates :nombre, presence: true, uniqueness: true
end 