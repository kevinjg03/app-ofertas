# Configuración adicional para Devise
Devise.setup do |config|
  # Configurar el modelo de usuario
  config.scoped_views = true
  
  # Configurar las rutas
  config.sign_out_via = :delete
  
  # Configurar el tiempo de sesión
  config.timeout_in = 30.minutes
  
  # Configurar el número máximo de intentos de login
  config.maximum_attempts = 5
  
  # Configurar el tiempo de bloqueo
  config.unlock_in = 1.hour
end 