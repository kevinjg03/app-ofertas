# Interfaz de Productos - AppOfertas

## Descripción

Se ha implementado una nueva interfaz de productos inspirada en la aplicación DealShare, con un diseño moderno y funcionalidades interactivas.

## Características Implementadas

### 🎨 Diseño Visual

- **Header con búsqueda**: Barra de búsqueda en tiempo real
- **Feed de productos**: Diseño de tarjetas similar a redes sociales
- **Navegación inferior**: Barra de navegación fija en la parte inferior
- **Animaciones**: Transiciones suaves y efectos hover
- **Responsive**: Diseño adaptativo para móviles y desktop

### 📱 Funcionalidades Interactivas

- **Búsqueda en tiempo real**: Filtra productos mientras escribes
- **Sistema de likes**: Botones interactivos para dar like
- **Comentarios**: Funcionalidad de comentarios (simulada)
- **Compartir**: Botón para compartir productos
- **Notificaciones**: Mensajes de confirmación para acciones

### 🎯 Información Dinámica

- **Tiempo transcurrido**: Muestra cuánto tiempo hace que se creó el producto
- **Precios actuales**: Muestra el precio más reciente si está disponible
- **Descuentos**: Calcula y muestra porcentajes de descuento
- **Ubicaciones**: Muestra la ubicación más frecuente del producto
- **Comercios**: Identifica el comercio principal donde se encuentra

## Estructura de Archivos

### Vistas

- `app/views/productos/index.html.erb` - Vista principal del feed de productos

### Modelos

- `app/models/producto.rb` - Modelo con métodos dinámicos para mostrar información

### JavaScript

- `app/javascript/controllers/products_controller.js` - Controlador Stimulus para funcionalidades interactivas

### Estilos

- `app/assets/stylesheets/application.css` - Estilos personalizados y animaciones

## Métodos del Modelo Producto

### `precio_actual`

Obtiene el precio más reciente del producto desde los registros de precios.

### `precio_mas_bajo`

Obtiene el precio más bajo registrado para el producto.

### `descuento_porcentaje`

Calcula el porcentaje de descuento basado en el precio actual vs el más bajo.

### `tiempo_transcurrido`

Muestra el tiempo transcurrido desde la creación del producto en formato legible.

### `comercio_principal`

Identifica el comercio donde más se ha registrado el producto.

### `ubicacion_principal`

Obtiene la ubicación más frecuente donde se ha registrado el producto.

## Funcionalidades JavaScript

### Búsqueda en Tiempo Real

```javascript
search() {
  const query = this.searchTarget.value.toLowerCase()
  // Filtra productos por nombre y descripción
}
```

### Sistema de Likes

```javascript
like(event) {
  // Alterna el estado de like/unlike
  // Actualiza el contador visualmente
}
```

### Notificaciones

```javascript
showNotification(message) {
  // Muestra notificaciones temporales
}
```

## Clases CSS Personalizadas

### `.product-card`

- Transiciones suaves al hacer hover
- Elevación de sombra al interactuar

### `.engagement-button`

- Animación de escala al hacer hover
- Transiciones de color

### `.discount-badge`

- Efecto de blur de fondo
- Transparencia y bordes redondeados

### `.gradient-text`

- Texto con gradiente naranja
- Efecto visual atractivo

## Uso

1. **Navegar al feed**: Accede a `/productos` para ver el feed
2. **Buscar productos**: Usa la barra de búsqueda para filtrar
3. **Interactuar**: Haz clic en los botones de like, comentario y compartir
4. **Ver detalles**: Haz clic en el ícono de ojo para ver más detalles
5. **Editar**: Usa el ícono de lápiz para editar productos
6. **Agregar nuevo**: Usa el botón "Nuevo Producto" en el header

## Tecnologías Utilizadas

- **Rails 7** - Framework backend
- **Tailwind CSS** - Framework de estilos
- **Stimulus** - Framework JavaScript para interactividad
- **Hotwire** - Para actualizaciones en tiempo real
- **SVG Icons** - Iconografía consistente

## Próximas Mejoras

- [ ] Integración con imágenes reales de productos
- [ ] Sistema de comentarios real con base de datos
- [ ] Funcionalidad de compartir en redes sociales
- [ ] Filtros avanzados por categoría y precio
- [ ] Notificaciones push para nuevos productos
- [ ] Modo oscuro
- [ ] Geolocalización para mostrar productos cercanos
