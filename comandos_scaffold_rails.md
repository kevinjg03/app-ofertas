# Comandos de Scaffold para Ruby on Rails - Sistema de Ofertas

## 1. Generar las enumeraciones (migraciones separadas)

```bash
# Crear migración para roles
rails generate migration CreateRoles name:string

# Crear migración para estados de registro
rails generate migration CreateEstadoRegistros name:string

# Crear migración para tipos de notificación
rails generate migration CreateTipoNotificaciones name:string
```

## 2. Generar los modelos principales

```bash
# Usuario (con rol)
rails generate scaffold Usuario nombre_usuario:string correo:string clave_hash:string unidad_monetaria:string preferencias_notificaciones:boolean fecha_registro:datetime rol:references

# Categoría
rails generate scaffold Categoria nombre:string

# Comercio
rails generate scaffold Comercio nombre:string direccion:string latitud:float longitud:float

# Producto
rails generate scaffold Producto nombre:string marca:string presentacion:string descripcion:text categoria:references

# Registro de Precio
rails generate scaffold RegistroPrecio precio:decimal moneda:string fecha_registro:datetime foto_ticket_url:string latitud:float longitud:float es_atipico:boolean estado_registro:references producto:references comercio:references usuario:references

# Lista de Compra
rails generate scaffold ListaCompra nombre:string fecha_creacion:datetime usuario:references

# Detalle de Lista
rails generate scaffold ListaDetalle cantidad:integer prioridad:integer lista_compra:references producto:references

# Notificación
rails generate scaffold Notificacion tipo_notificacion:references mensaje:text fecha_envio:datetime estado_leido:boolean medio:string usuario:references producto:references

# Preferencias
rails generate scaffold Preferencias unidad_monetaria:string recibir_notificaciones:boolean usuario:references
```

## 3. Generar modelos para roles especiales

```bash
# Moderador
rails generate scaffold Moderador usuario:references

# Administrador
rails generate scaffold Administrador usuario:references
```

## 4. Comandos adicionales para servicios (opcional)

```bash
# Generar servicios como clases Ruby
rails generate service ServicioAutenticacion
rails generate service ServicioValidacion
rails generate service ServicioNormalizacion
rails generate service ServicioRecomendacion
rails generate service ServicioNotificaciones
```

## 5. Comandos para ejecutar las migraciones

```bash
# Ejecutar todas las migraciones
rails db:migrate

# Si necesitas revertir
rails db:rollback
```

## 6. Comandos para poblar datos iniciales

```bash
# Crear seed para roles
rails generate migration AddDefaultRoles

# Crear seed para estados de registro
rails generate migration AddDefaultEstadoRegistros

# Crear seed para tipos de notificación
rails generate migration AddDefaultTipoNotificaciones
```

## 7. Comandos para generar controladores adicionales

```bash
# Controladores para funcionalidades específicas
rails generate controller Dashboard index
rails generate controller Reportes index
rails generate controller Busqueda index
rails generate controller Recomendaciones index
```

## 8. Comandos para generar modelos de autenticación (si usas Devise)

```bash
# Instalar Devise
rails generate devise:install

# Generar modelo de usuario con Devise
rails generate devise Usuario

# Generar vistas de Devise
rails generate devise:views
```

## Notas importantes:

1. **Relaciones**: Los scaffolds generarán automáticamente las relaciones básicas, pero necesitarás agregar las relaciones más complejas manualmente en los modelos.

2. **Validaciones**: Agregarás las validaciones necesarias en los modelos después de la generación.

3. **Índices**: Considera agregar índices en las migraciones para campos frecuentemente consultados como `correo`, `fecha_registro`, etc.

4. **Seguridad**: Para el campo `clave_hash`, considera usar bcrypt o Devise para el hash de contraseñas.

5. **API**: Si planeas crear una API, puedes agregar `--api` a los comandos de scaffold.

## Ejemplo de migración con índices:

```bash
# Ejemplo de migración mejorada para Usuario
rails generate migration CreateUsuarios nombre_usuario:string:index correo:string:index clave_hash:string unidad_monetaria:string preferencias_notificaciones:boolean fecha_registro:datetime rol:references
```
