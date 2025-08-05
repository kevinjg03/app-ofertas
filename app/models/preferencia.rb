class Preferencium < ApplicationRecord
  self.table_name = 'preferencia'
  
  belongs_to :usuario
  
  validates :unidad_monetaria, presence: true
end
