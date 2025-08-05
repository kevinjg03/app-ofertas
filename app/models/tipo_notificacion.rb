class TipoNotificacion < ApplicationRecord
  self.table_name = 'tipo_notificaciones'
  
  has_many :notificacions
  
  validates :name, presence: true, uniqueness: true
end 