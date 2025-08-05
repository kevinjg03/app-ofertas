# Configuración de Hotwire para la Vista de Login

## Requisitos Previos

### 1. Instalar Hotwire

```bash
# Agregar Hotwire al Gemfile
bundle add turbo-rails
bundle add stimulus-rails

# Instalar Hotwire
rails turbo:install
rails stimulus:install
```

### 2. Configurar Tailwind CSS

```bash
# Instalar Tailwind CSS
bundle add tailwindcss-rails
rails tailwindcss:install
```

### 3. Configurar el Layout

Asegúrate de que tu `app/views/layouts/application.html.erb` incluya:

```erb
<!DOCTYPE html>
<html>
  <head>
    <title>AppOfertas</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
    <%= javascript_importmap_tags %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>
```

## Características Implementadas

### 1. Vista de Login Moderna

- ✅ Diseño responsive con Tailwind CSS
- ✅ Validación en tiempo real con Stimulus
- ✅ Toggle de visibilidad de contraseña
- ✅ Estados de error y éxito
- ✅ Animaciones suaves
- ✅ Compatible con Devise

### 2. Controladores Stimulus

- **Password Toggle Controller**: Maneja la visibilidad de la contraseña
- **Form Validation Controller**: Valida email y contraseña en tiempo real

### 3. Estilos CSS

- Estilos específicos para Devise
- Animaciones y transiciones
- Estados de error y éxito
- Diseño responsive

## Archivos Creados/Modificados

1. `app/views/devise/sessions/new.html.erb` - Vista de login principal
2. `app/javascript/controllers/password_toggle_controller.js` - Controlador para toggle de contraseña
3. `app/javascript/controllers/form_validation_controller.js` - Controlador para validación
4. `app/javascript/controllers/index.js` - Registro de controladores
5. `app/assets/stylesheets/devise.css` - Estilos específicos

## Comandos de Instalación

```bash
# 1. Instalar dependencias
bundle add turbo-rails stimulus-rails tailwindcss-rails

# 2. Instalar Hotwire
rails turbo:install
rails stimulus:install

# 3. Instalar Tailwind CSS
rails tailwindcss:install

# 4. Compilar assets
rails assets:precompile

# 5. Reiniciar el servidor
rails server
```

## Funcionalidades

### Validación en Tiempo Real

- Validación de email con regex
- Validación de contraseña (mínimo 6 caracteres)
- Mensajes de error dinámicos
- Estados visuales de éxito/error

### Toggle de Contraseña

- Botón con iconos SVG
- Cambio suave entre mostrar/ocultar
- Accesibilidad mejorada

### Diseño Responsive

- Adaptable a móviles y tablets
- Tipografía optimizada
- Espaciado consistente

### Integración con Devise

- Compatible con el sistema de autenticación
- Mantiene todas las funcionalidades de Devise
- Estilos consistentes

## Personalización

### Cambiar Colores

Modifica las clases de Tailwind en `new.html.erb`:

- `bg-green-600` → `bg-blue-600` (para azul)
- `text-green-600` → `text-blue-600`

### Agregar Validaciones

Edita `form_validation_controller.js` para agregar nuevas validaciones.

### Modificar Animaciones

Ajusta las animaciones en `devise.css`.

## Troubleshooting

### Si los controladores no funcionan:

1. Verifica que Stimulus esté instalado: `rails stimulus:install`
2. Revisa la consola del navegador para errores
3. Asegúrate de que los controladores estén registrados en `index.js`

### Si los estilos no se aplican:

1. Ejecuta: `rails tailwindcss:build`
2. Verifica que el CSS esté incluido en el layout
3. Limpia la caché: `rails assets:clobber && rails assets:precompile`

### Si Devise no funciona:

1. Verifica la configuración de Devise
2. Asegúrate de que las rutas estén correctas
3. Revisa los logs del servidor
