class Notificacion < ApplicationRecord
  self.table_name = 'notificacions'
  
  belongs_to :tipo_notificacion
  belongs_to :usuario
  belongs_to :producto
  
  validates :mensaje, presence: true
  validates :fecha_envio, presence: true
end
