#!/bin/bash

# Script para generar todos los scaffolds de Ruby on Rails
# Sistema de Ofertas - AppOfertas

set -e  # Salir si cualquier comando falla

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para imprimir mensajes con colores
print_message() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Función para verificar si estamos en un proyecto Rails
check_rails_project() {
    if [ ! -f "Gemfile" ] || [ ! -d "app" ]; then
        print_error "No se detectó un proyecto Rails válido. Ejecuta este script desde la raíz de tu proyecto Rails."
        exit 1
    fi
}

# Función para ejecutar comando con verificación
execute_command() {
    local cmd="$1"
    local description="$2"
    
    print_message "Ejecutando: $description"
    echo "Comando: $cmd"
    
    if eval "$cmd"; then
        print_success "$description completado"
    else
        print_error "Error ejecutando: $description"
        exit 1
    fi
    echo ""
}

# Función para preguntar confirmación
confirm_execution() {
    echo -e "${YELLOW}¿Estás seguro de que quieres ejecutar todos los comandos de scaffold? (y/N)${NC}"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        print_warning "Operación cancelada por el usuario"
        exit 0
    fi
}

# Función principal
main() {
    echo "=========================================="
    echo "  GENERADOR DE SCAFFOLDS - APPOFERTAS"
    echo "=========================================="
    echo ""
    
    # Verificar que estamos en un proyecto Rails
    check_rails_project
    print_success "Proyecto Rails detectado"
    
    # Preguntar confirmación
    confirm_execution
    
    print_message "Iniciando generación de scaffolds..."
    echo ""
    
    # 1. Generar las enumeraciones
    print_message "=== PASO 1: Generando enumeraciones ==="
    execute_command "rails generate migration CreateRoles name:string" "Crear migración para roles"
    execute_command "rails generate migration CreateEstadoRegistros name:string" "Crear migración para estados de registro"
    execute_command "rails generate migration CreateTipoNotificaciones name:string" "Crear migración para tipos de notificación"
    
    # 2. Generar los modelos principales
    print_message "=== PASO 2: Generando modelos principales ==="
    execute_command "rails generate scaffold Usuario nombre_usuario:string correo:string clave_hash:string unidad_monetaria:string preferencias_notificaciones:boolean fecha_registro:datetime rol:references" "Generar scaffold Usuario"
    execute_command "rails generate scaffold Categoria nombre:string" "Generar scaffold Categoria"
    execute_command "rails generate scaffold Comercio nombre:string direccion:string latitud:float longitud:float" "Generar scaffold Comercio"
    execute_command "rails generate scaffold Producto nombre:string marca:string presentacion:string descripcion:text categoria:references" "Generar scaffold Producto"
    execute_command "rails generate scaffold RegistroPrecio precio:decimal moneda:string fecha_registro:datetime foto_ticket_url:string latitud:float longitud:float es_atipico:boolean estado_registro:references producto:references comercio:references usuario:references" "Generar scaffold RegistroPrecio"
    execute_command "rails generate scaffold ListaCompra nombre:string fecha_creacion:datetime usuario:references" "Generar scaffold ListaCompra"
    execute_command "rails generate scaffold ListaDetalle cantidad:integer prioridad:integer lista_compra:references producto:references" "Generar scaffold ListaDetalle"
    execute_command "rails generate scaffold Notificacion tipo_notificacion:references mensaje:text fecha_envio:datetime estado_leido:boolean medio:string usuario:references producto:references" "Generar scaffold Notificacion"
    execute_command "rails generate scaffold Preferencias unidad_monetaria:string recibir_notificaciones:boolean usuario:references" "Generar scaffold Preferencias"
    
    # 3. Generar modelos para roles especiales
    print_message "=== PASO 3: Generando modelos para roles especiales ==="
    execute_command "rails generate scaffold Moderador usuario:references" "Generar scaffold Moderador"
    execute_command "rails generate scaffold Administrador usuario:references" "Generar scaffold Administrador"
    
    # 4. Generar servicios
    print_message "=== PASO 4: Generando servicios ==="
    execute_command "rails generate service ServicioAutenticacion" "Generar servicio ServicioAutenticacion"
    execute_command "rails generate service ServicioValidacion" "Generar servicio ServicioValidacion"
    execute_command "rails generate service ServicioNormalizacion" "Generar servicio ServicioNormalizacion"
    execute_command "rails generate service ServicioRecomendacion" "Generar servicio ServicioRecomendacion"
    execute_command "rails generate service ServicioNotificaciones" "Generar servicio ServicioNotificaciones"
    
    # 5. Generar controladores adicionales
    print_message "=== PASO 5: Generando controladores adicionales ==="
    execute_command "rails generate controller Dashboard index" "Generar controlador Dashboard"
    execute_command "rails generate controller Reportes index" "Generar controlador Reportes"
    execute_command "rails generate controller Busqueda index" "Generar controlador Busqueda"
    execute_command "rails generate controller Recomendaciones index" "Generar controlador Recomendaciones"
    
    # 6. Crear migraciones para datos iniciales
    print_message "=== PASO 6: Creando migraciones para datos iniciales ==="
    execute_command "rails generate migration AddDefaultRoles" "Crear migración para roles por defecto"
    execute_command "rails generate migration AddDefaultEstadoRegistros" "Crear migración para estados por defecto"
    execute_command "rails generate migration AddDefaultTipoNotificaciones" "Crear migración para tipos de notificación por defecto"
    
    # 7. Ejecutar migraciones
    print_message "=== PASO 7: Ejecutando migraciones ==="
    execute_command "rails db:migrate" "Ejecutar todas las migraciones"
    
    print_success "¡Todos los scaffolds han sido generados exitosamente!"
    echo ""
    echo "=========================================="
    echo "  PRÓXIMOS PASOS RECOMENDADOS:"
    echo "=========================================="
    echo "1. Revisar y ajustar las relaciones en los modelos"
    echo "2. Agregar validaciones necesarias"
    echo "3. Configurar Devise para autenticación (opcional)"
    echo "4. Poblar datos iniciales en las migraciones de seeds"
    echo "5. Configurar rutas en config/routes.rb"
    echo "6. Crear vistas y estilos"
    echo ""
    echo "Para instalar Devise (recomendado):"
    echo "  bundle add devise"
    echo "  rails generate devise:install"
    echo "  rails generate devise Usuario"
    echo "  rails generate devise:views"
    echo ""
}

# Ejecutar función principal
main "$@" 