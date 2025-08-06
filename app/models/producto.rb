class Producto < ApplicationRecord
  belongs_to :categoria
  has_many :registro_precios, dependent: :destroy
  
  # Método para obtener el precio más reciente
  def precio_actual
    registro_precios.order(fecha_registro: :desc).first&.precio
  end
  
  # Método para obtener el precio más bajo
  def precio_mas_bajo
    registro_precios.minimum(:precio)
  end
  
  # Método para calcular el descuento (simulado)
  def descuento_porcentaje
    return 0 unless precio_actual && precio_mas_bajo
    return 0 if precio_actual == precio_mas_bajo
    
    ((precio_actual - precio_mas_bajo) / precio_actual * 100).round
  end
  
  # Método para obtener el tiempo transcurrido desde la creación
  def tiempo_transcurrido
    tiempo = Time.current - created_at
    
    case
    when tiempo < 1.hour
      "Hace #{tiempo.to_i / 1.minute} minutos"
    when tiempo < 24.hours
      "Hace #{tiempo.to_i / 1.hour} horas"
    when tiempo < 7.days
      "Hace #{tiempo.to_i / 1.day} días"
    else
      created_at.strftime("%d/%m/%Y")
    end
  end
  
  # Método para obtener el comercio más frecuente
  def comercio_principal
    comercio_mas_frecuente = registro_precios.joins(:comercio)
                                             .group('comercios.nombre')
                                             .order(Arel.sql('COUNT(*) DESC'))
                                             .limit(1)
                                             .pluck('comercios.nombre')
                                             .first
    
    comercio_mas_frecuente || "SuperMercado"
  end
  
  # Método para obtener la ubicación más frecuente
  def ubicacion_principal
    ubicacion_mas_frecuente = registro_precios.where.not(latitud: nil, longitud: nil)
                                             .group(:latitud, :longitud)
                                             .order(Arel.sql('COUNT(*) DESC'))
                                             .limit(1)
                                             .pluck(:latitud, :longitud)
                                             .first
    
    if ubicacion_mas_frecuente
      lat, lng = ubicacion_mas_frecuente
      "#{lat.round(2)}, #{lng.round(2)}"
    else
      "123 Calle Principal, Ciudad"
    end
  end
end
