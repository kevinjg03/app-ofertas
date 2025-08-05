json.extract! producto, :id, :nombre, :marca, :presentacion, :descripcion, :categoria_id, :created_at, :updated_at
json.url producto_url(producto, format: :json)
