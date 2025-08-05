json.extract! notificacion, :id, :tipo_notificacion_id, :mensaje, :fecha_envio, :estado_leido, :medio, :usuario_id, :producto_id, :created_at, :updated_at
json.url notificacion_url(notificacion, format: :json)
