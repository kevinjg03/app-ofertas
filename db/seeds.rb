# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "🌱 Iniciando la carga de datos de ejemplo..."

# Crear roles
puts "📋 Creando roles..."
roles = [
  { name: "Usuario" },
  { name: "Moderador" },
  { name: "Administrador" }
]

roles.each do |role_data|
  Role.find_or_create_by!(name: role_data[:name])
end

# Crear estados de registro
puts "📊 Creando estados de registro..."
estados = [
  { name: "Pendiente" },
  { name: "Aprobado" },
  { name: "Rechazado" },
  { name: "Verificado" }
]

estados.each do |estado_data|
  EstadoRegistro.find_or_create_by!(name: estado_data[:name])
end

# Crear tipos de notificación
puts "🔔 Creando tipos de notificación..."
tipos_notificacion = [
  { name: "Nuevo producto" },
  { name: "Precio actualizado" },
  { name: "Oferta especial" },
  { name: "Recordatorio" }
]

tipos_notificacion.each do |tipo_data|
  TipoNotificacion.find_or_create_by!(name: tipo_data[:name])
end

# Crear categorías
puts "🏷️ Creando categorías..."
categorias = [
  { nombre: "Alimentos y Bebidas" },
  { nombre: "Limpieza y Hogar" },
  { nombre: "Cuidado Personal" },
  { nombre: "Electrónicos" },
  { nombre: "Ropa y Accesorios" },
  { nombre: "Deportes y Aire Libre" },
  { nombre: "Juguetes y Entretenimiento" },
  { nombre: "Automotriz" },
  { nombre: "Jardín y Exterior" },
  { nombre: "Mascotas" }
]

categorias.each do |categoria_data|
  Categoria.find_or_create_by!(nombre: categoria_data[:nombre])
end

# Crear comercios
puts "🏪 Creando comercios..."
comercios = [
  { nombre: "SuperMercado Central", direccion: "Av. Principal 123, Ciudad", latitud: 19.4326, longitud: -99.1332 },
  { nombre: "Tienda Express", direccion: "Calle Comercial 456, Ciudad", latitud: 19.4326, longitud: -99.1332 },
  { nombre: "MegaStore", direccion: "Plaza Mayor 789, Ciudad", latitud: 19.4326, longitud: -99.1332 },
  { nombre: "MiniMarket", direccion: "Calle Pequeña 321, Ciudad", latitud: 19.4326, longitud: -99.1332 },
  { nombre: "SuperAhorro", direccion: "Av. Económica 654, Ciudad", latitud: 19.4326, longitud: -99.1332 },
  { nombre: "Tienda Familiar", direccion: "Calle Residencial 987, Ciudad", latitud: 19.4326, longitud: -99.1332 }
]

comercios.each do |comercio_data|
  Comercio.find_or_create_by!(nombre: comercio_data[:nombre]) do |c|
    c.direccion = comercio_data[:direccion]
    c.latitud = comercio_data[:latitud]
    c.longitud = comercio_data[:longitud]
  end
end

# Crear usuarios de ejemplo
puts "👥 Creando usuarios de ejemplo..."
usuarios = [
  { email: "usuario1@example.com", password: "password123", ombre_usuario: "Juan Pérez" },
  { email: "usuario2@example.com", password: "password123", ombre_usuario: "María García" },
  { email: "usuario3@example.com", password: "password123", ombre_usuario: "Carlos López" },
  { email: "moderador@example.com", password: "password123", ombre_usuario: "Ana Moderador" },
  { email: "admin@example.com", password: "password123", ombre_usuario: "Admin Sistema" }
]

usuarios.each do |usuario_data|
  usuario = Usuario.find_or_create_by!(email: usuario_data[:email]) do |u|
    u.password = usuario_data[:password]
    u.ombre_usuario = usuario_data[:ombre_usuario]
    u.correo = usuario_data[:email]
    u.unidad_monetaria = "MXN"
    u.preferencias_notificaciones = true
    u.fecha_registro = Time.current
  end
  
  # Asignar roles según el email
  if usuario.email.include?("moderador")
    rol = Role.find_by(name: "Moderador")
    Moderador.find_or_create_by!(usuario: usuario)
  elsif usuario.email.include?("admin")
    rol = Role.find_by(name: "Administrador")
    Administrador.find_or_create_by!(usuario: usuario)
  else
    rol = Role.find_by(name: "Usuario")
  end
  
  usuario.update!(rol: rol) if rol
end

# Crear productos
puts "📦 Creando productos..."
productos = [
  {
    nombre: "Leche Entera",
    marca: "Lala",
    presentacion: "1 Litro",
    descripcion: "Leche fresca pasteurizada, rica en calcio y vitaminas. Perfecta para el consumo diario de toda la familia.",
    categoria: "Alimentos y Bebidas"
  },
  {
    nombre: "Pan Integral",
    marca: "Bimbo",
    presentacion: "680g",
    descripcion: "Pan integral con granos enteros, rico en fibra y nutrientes. Ideal para una alimentación saludable.",
    categoria: "Alimentos y Bebidas"
  },
  {
    nombre: "Detergente Líquido",
    marca: "Ariel",
    presentacion: "2.5 Litros",
    descripcion: "Detergente líquido para ropa, elimina manchas difíciles y cuida los colores. Rendimiento superior.",
    categoria: "Limpieza y Hogar"
  },
  {
    nombre: "Shampoo Anticaspa",
    marca: "Head & Shoulders",
    presentacion: "400ml",
    descripcion: "Shampoo especializado para eliminar la caspa y mantener el cuero cabelludo saludable.",
    categoria: "Cuidado Personal"
  },
  {
    nombre: "Cereal de Avena",
    marca: "Quaker",
    presentacion: "500g",
    descripcion: "Cereal de avena natural, sin azúcares añadidos. Rico en fibra y proteínas vegetales.",
    categoria: "Alimentos y Bebidas"
  },
  {
    nombre: "Aceite de Oliva",
    marca: "Bertolli",
    presentacion: "500ml",
    descripcion: "Aceite de oliva extra virgen, perfecto para cocinar y aderezar ensaladas. Sabor mediterráneo.",
    categoria: "Alimentos y Bebidas"
  },
  {
    nombre: "Pasta Dental",
    marca: "Colgate",
    presentacion: "150g",
    descripcion: "Pasta dental con flúor, protege contra las caries y mantiene el aliento fresco.",
    categoria: "Cuidado Personal"
  },
  {
    nombre: "Papel Higiénico",
    marca: "Kleenex",
    presentacion: "12 Rollos",
    descripcion: "Papel higiénico suave y resistente, triple capa para mayor comodidad.",
    categoria: "Limpieza y Hogar"
  },
  {
    nombre: "Yogur Natural",
    marca: "Danone",
    presentacion: "1kg",
    descripcion: "Yogur natural sin azúcar, rico en probióticos. Ideal para el desayuno o como snack saludable.",
    categoria: "Alimentos y Bebidas"
  },
  {
    nombre: "Desodorante",
    marca: "Dove",
    presentacion: "150ml",
    descripcion: "Desodorante en aerosol, protección de 48 horas contra el mal olor y la humedad.",
    categoria: "Cuidado Personal"
  },
  {
    nombre: "Café Molido",
    marca: "Nescafé",
    presentacion: "200g",
    descripcion: "Café molido de grano arábica, aroma intenso y sabor equilibrado. Perfecto para cafetera.",
    categoria: "Alimentos y Bebidas"
  },
  {
    nombre: "Jabón de Manos",
    marca: "Dove",
    presentacion: "250ml",
    descripcion: "Jabón líquido para manos, hidratante y suave. No reseca la piel.",
    categoria: "Cuidado Personal"
  },
  {
    nombre: "Arroz Blanco",
    marca: "La Costeña",
    presentacion: "1kg",
    descripcion: "Arroz blanco de grano largo, cocción perfecta y sabor natural. Ideal para todo tipo de platillos.",
    categoria: "Alimentos y Bebidas"
  },
  {
    nombre: "Aceite de Coco",
    marca: "Nature's Way",
    presentacion: "500ml",
    descripcion: "Aceite de coco virgen extra, perfecto para cocinar y uso cosmético. Rico en ácidos grasos saludables.",
    categoria: "Alimentos y Bebidas"
  },
  {
    nombre: "Crema Facial",
    marca: "Nivea",
    presentacion: "100ml",
    descripcion: "Crema facial hidratante, nutre y protege la piel del rostro. Apto para todo tipo de piel.",
    categoria: "Cuidado Personal"
  }
]

productos.each do |producto_data|
  categoria = Categoria.find_by(nombre: producto_data[:categoria])
  next unless categoria
  
  producto = Producto.find_or_create_by!(nombre: producto_data[:nombre], marca: producto_data[:marca]) do |p|
    p.presentacion = producto_data[:presentacion]
    p.descripcion = producto_data[:descripcion]
    p.categoria = categoria
  end
end

# Crear registros de precios
puts "💰 Creando registros de precios..."
usuarios = Usuario.where.not(email: ["admin@example.com", "moderador@example.com"])
productos = Producto.all
comercios = Comercio.all
estado_aprobado = EstadoRegistro.find_by(name: "Aprobado")

productos.each do |producto|
  # Crear 2-4 registros de precios por producto
  rand(2..4).times do
    comercio = comercios.sample
    usuario = usuarios.sample
    
    # Generar precio base según el producto
    precio_base = case producto.nombre
    when /leche/i then rand(18..25)
    when /pan/i then rand(25..35)
    when /detergente/i then rand(45..65)
    when /shampoo/i then rand(35..50)
    when /cereal/i then rand(30..45)
    when /aceite/i then rand(40..60)
    when /pasta/i then rand(25..35)
    when /papel/i then rand(45..65)
    when /yogur/i then rand(35..50)
    when /desodorante/i then rand(40..55)
    when /café/i then rand(50..70)
    when /jabón/i then rand(25..40)
    when /arroz/i then rand(20..30)
    when /crema/i then rand(80..120)
    else rand(20..100)
    end
    
    # Aplicar descuento aleatorio
    descuento = rand(0..30)
    precio_final = precio_base * (1 - descuento / 100.0)
    
    RegistroPrecio.find_or_create_by!(
      producto: producto,
      comercio: comercio,
      usuario: usuario,
      precio: precio_final.round(2),
      moneda: "MXN",
      fecha_registro: rand(1..30).days.ago,
      foto_ticket_url: nil,
      latitud: comercio.latitud + rand(-0.01..0.01),
      longitud: comercio.longitud + rand(-0.01..0.01),
      es_atipico: rand < 0.1, # 10% de probabilidad de ser atípico
      estado_registro: estado_aprobado
    )
  end
end

# Crear listas de compras de ejemplo
puts "🛒 Creando listas de compras..."
usuarios.each do |usuario|
  rand(1..3).times do
    lista = ListaCompra.find_or_create_by!(
      nombre: ["Compras Semanales", "Lista del Mes", "Productos Básicos", "Ofertas Especiales"].sample,
      usuario: usuario,
      fecha_creacion: rand(1..7).days.ago
    )
    
    # Agregar productos aleatorios a la lista
    productos_aleatorios = productos.sample(rand(3..8))
    productos_aleatorios.each_with_index do |producto, index|
      ListaDetalle.find_or_create_by!(
        lista_compra: lista,
        producto: producto,
        cantidad: rand(1..5),
        prioridad: index + 1
      )
    end
  end
end

# Crear notificaciones de ejemplo
puts "🔔 Creando notificaciones..."
tipos = TipoNotificacion.all
usuarios.each do |usuario|
  rand(2..5).times do
    producto = productos.sample
    tipo = tipos.sample
    
    Notificacion.find_or_create_by!(
      tipo_notificacion: tipo,
      mensaje: case tipo.name
      when "Nuevo producto"
        "Se ha agregado un nuevo producto: #{producto.nombre}"
      when "Precio actualizado"
        "El precio de #{producto.nombre} ha cambiado"
      when "Oferta especial"
        "¡Oferta especial en #{producto.nombre}!"
      else
        "Tienes una nueva notificación sobre #{producto.nombre}"
      end,
      fecha_envio: rand(1..14).days.ago,
      estado_leido: rand < 0.7, # 70% de probabilidad de estar leído
      medio: ["email", "push", "sms"].sample,
      usuario: usuario,
      producto: producto
    )
  end
end

# Crear preferencias de usuario
puts "⚙️ Creando preferencias de usuario..."
usuarios.each do |usuario|
  Preferencium.find_or_create_by!(usuario: usuario) do |p|
    p.unidad_monetaria = "MXN"
    p.recibir_notificaciones = true
  end
end

puts "✅ ¡Datos de ejemplo cargados exitosamente!"
puts "📊 Resumen:"
puts "   - #{Role.count} roles"
puts "   - #{EstadoRegistro.count} estados de registro"
puts "   - #{TipoNotificacion.count} tipos de notificación"
puts "   - #{Categoria.count} categorías"
puts "   - #{Comercio.count} comercios"
puts "   - #{Usuario.count} usuarios"
puts "   - #{Producto.count} productos"
puts "   - #{RegistroPrecio.count} registros de precios"
puts "   - #{ListaCompra.count} listas de compras"
puts "   - #{Notificacion.count} notificaciones"
puts "   - #{Preferencium.count} preferencias"

puts "\n🎉 ¡La aplicación está lista para usar!"
puts "💡 Puedes iniciar sesión con cualquiera de estos usuarios:"
puts "   - usuario1@example.com / password123"
puts "   - usuario2@example.com / password123"
puts "   - usuario3@example.com / password123"
puts "   - moderador@example.com / password123"
puts "   - admin@example.com / password123"
