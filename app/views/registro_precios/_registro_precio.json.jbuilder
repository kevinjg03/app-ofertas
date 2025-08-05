json.extract! registro_precio, :id, :precio, :moneda, :fecha_registro, :foto_ticket_url, :latitud, :longitud, :es_atipico, :estado_registro_id, :producto_id, :comercio_id, :usuario_id, :created_at, :updated_at
json.url registro_precio_url(registro_precio, format: :json)
