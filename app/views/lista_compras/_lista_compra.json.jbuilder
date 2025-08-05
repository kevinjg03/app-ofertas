json.extract! lista_compra, :id, :nombre, :fecha_creacion, :usuario_id, :created_at, :updated_at
json.url lista_compra_url(lista_compra, format: :json)
