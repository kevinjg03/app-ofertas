# Configuración de Devise - AppOfertas

## 🔧 Problema Resuelto

El error `undefined method 'user_signed_in?'` se ha resuelto configurando correctamente Devise para usar el modelo `Usuario` en lugar de `User`.

## ✅ Cambios Realizados

### **1. Configuración del Modelo**

- ✅ Modelo `Usuario` configurado con Devise
- ✅ Módulos de Devise habilitados: `:database_authenticatable`, `:registerable`, `:recoverable`, `:rememberable`, `:validatable`

### **2. Controladores Personalizados**

- ✅ `Usuarios::SessionsController` - Para manejo de sesiones
- ✅ `Usuarios::RegistrationsController` - Para registro de usuarios
- ✅ `AuthenticatedController` - Para páginas que requieren autenticación

### **3. Rutas Configuradas**

```ruby
devise_for :usuarios, controllers: {
  sessions: 'usuarios/sessions',
  registrations: 'usuarios/registrations'
}
```

### **4. Layout Actualizado**

- ✅ Cambiado `user_signed_in?` por `usuario_signed_in?`
- ✅ Rutas actualizadas para usar `usuario_` en lugar de `user_`

## 🚀 Comandos de Instalación

### **1. Instalar Dependencias**

```bash
bundle install
```

### **2. Ejecutar Migraciones**

```bash
rails db:migrate
```

### **3. Reiniciar Servidor**

```bash
rails server
```

## 📁 Archivos Modificados

1. **`app/models/usuario.rb`** - Modelo configurado con Devise
2. **`app/controllers/application_controller.rb`** - Helpers de Devise incluidos
3. **`app/controllers/usuarios/sessions_controller.rb`** - Controlador de sesiones
4. **`app/controllers/usuarios/registrations_controller.rb`** - Controlador de registros
5. **`app/controllers/authenticated_controller.rb`** - Controlador para páginas autenticadas
6. **`app/views/layouts/application.html.erb`** - Layout actualizado
7. **`config/routes.rb`** - Rutas de Devise configuradas
8. **`config/application.rb`** - Configuración de Devise
9. **`app/helpers/application_helper.rb`** - Helpers incluidos

## 🔍 Helpers Disponibles

### **Autenticación**

- `usuario_signed_in?` - Verificar si hay usuario logueado
- `current_usuario` - Obtener usuario actual
- `usuario_session` - Acceder a la sesión

### **Rutas**

- `new_usuario_session_path` - Login
- `destroy_usuario_session_path` - Logout
- `new_usuario_registration_path` - Registro
- `edit_usuario_registration_path` - Editar perfil

### **Vistas**

- `new_usuario_session_path` - Vista de login
- `new_usuario_registration_path` - Vista de registro

## 🎯 Funcionalidades Disponibles

### **Registro de Usuarios**

- ✅ Formulario de registro con validación
- ✅ Confirmación de contraseña
- ✅ Términos y condiciones
- ✅ Medidor de fortaleza de contraseña

### **Login de Usuarios**

- ✅ Formulario de login con validación
- ✅ "Recordar sesión"
- ✅ "Olvidé mi contraseña"

### **Gestión de Sesiones**

- ✅ Login/logout automático
- ✅ Redirección después de login
- ✅ Protección de rutas

## 🔒 Seguridad

### **Configuraciones de Seguridad**

- ✅ Timeout de sesión: 30 minutos
- ✅ Máximo intentos de login: 5
- ✅ Tiempo de bloqueo: 1 hora
- ✅ Logout vía DELETE

### **Validaciones**

- ✅ Email único
- ✅ Contraseña mínima 6 caracteres
- ✅ Confirmación de contraseña
- ✅ Validación de email con regex

## 🎨 Personalización

### **Cambiar Modelo de Usuario**

Si quieres usar `User` en lugar de `Usuario`:

1. **Renombrar modelo:**

   ```bash
   rails generate devise User
   ```

2. **Actualizar rutas:**

   ```ruby
   devise_for :users
   ```

3. **Actualizar layout:**
   ```erb
   <% if user_signed_in? %>
   ```

### **Agregar Campos Adicionales**

1. **Crear migración:**

   ```bash
   rails generate migration AddFieldsToUsuarios nombre:string
   ```

2. **Actualizar controlador de registros:**
   ```ruby
   def sign_up_params
     params.require(:usuario).permit(:email, :password, :password_confirmation, :nombre)
   end
   ```

## 🔍 Troubleshooting

### **Si los helpers no funcionan:**

1. Verifica que Devise esté en el Gemfile
2. Ejecuta `bundle install`
3. Reinicia el servidor
4. Verifica que los controladores estén configurados

### **Si las rutas no funcionan:**

1. Verifica `config/routes.rb`
2. Ejecuta `rails routes | grep devise`
3. Reinicia el servidor

### **Si las migraciones fallan:**

1. Verifica que la base de datos esté creada
2. Ejecuta `rails db:create`
3. Ejecuta `rails db:migrate`

## 📱 Próximos Pasos

1. **Implementar verificación de email**
2. **Agregar roles de usuario (admin, moderador)**
3. **Implementar autenticación con redes sociales**
4. **Agregar captcha para registro**
5. **Implementar notificaciones push**

## 🎯 Comandos Útiles

```bash
# Verificar rutas de Devise
rails routes | grep devise

# Generar vistas de Devise
rails generate devise:views

# Generar controladores de Devise
rails generate devise:controllers usuarios

# Verificar configuración
rails console
> Usuario.new
```

¡Devise está ahora completamente configurado y funcionando!
