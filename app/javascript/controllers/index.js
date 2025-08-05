import { application } from "./application"

// Importar controladores
import PasswordToggleController from "./password_toggle_controller"
import FormValidationController from "./form_validation_controller"
import PasswordStrengthController from "./password_strength_controller"
import ProductsController from "./products_controller"
import ProductFormController from "./product_form_controller"

// Registrar controladores
application.register("password-toggle", PasswordToggleController)
application.register("form-validation", FormValidationController)
application.register("password-strength", PasswordStrengthController)
application.register("products", ProductsController)
application.register("product-form", ProductFormController)
