json.extract! lista_detalle, :id, :cantidad, :prioridad, :lista_compra_id, :producto_id, :created_at, :updated_at
json.url lista_detalle_url(lista_detalle, format: :json)
