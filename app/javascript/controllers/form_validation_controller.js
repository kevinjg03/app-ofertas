import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["emailError", "passwordError", "passwordConfirmationError", "submitButton"]

  connect() {
    console.log("Form validation controller connected")
  }

  validateEmail(event) {
    const email = event.target.value
    const emailError = this.emailErrorTarget
    const input = event.target

    if (this.isValidEmail(email)) {
      this.hideError(emailError)
      this.showSuccess(input)
    } else {
      this.showError(emailError, "Please enter a valid email address.")
      this.showError(input)
    }
  }

  validatePassword(event) {
    const password = event.target.value
    const passwordError = this.passwordErrorTarget
    const input = event.target
    const minLength = 6

    if (password.length >= minLength) {
      this.hideError(passwordError)
      this.showSuccess(input)
      this.validatePasswordConfirmation()
    } else {
      this.showError(passwordError, `Password must be at least ${minLength} characters.`)
      this.showError(input)
    }
  }

  validatePasswordConfirmation(event) {
    const passwordField = document.querySelector('input[name*="[password]"]')
    const confirmationField = document.querySelector('input[name*="[password_confirmation]"]')
    const confirmationError = this.passwordConfirmationErrorTarget
    
    if (!passwordField || !confirmationField) return

    const password = passwordField.value
    const confirmation = confirmationField.value

    if (confirmation.length === 0) {
      this.hideError(confirmationError)
      return
    }

    if (password === confirmation) {
      this.hideError(confirmationError)
      this.showSuccess(confirmationField)
    } else {
      this.showError(confirmationError, "Passwords do not match.")
      this.showError(confirmationField)
    }
  }

  isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    return emailRegex.test(email)
  }

  showError(element, message = null) {
    element.classList.add("form-error")
    element.classList.remove("form-success")
    
    if (message && element.classList.contains("hidden")) {
      element.textContent = message
      element.classList.remove("hidden")
    }
  }

  showSuccess(element) {
    element.classList.add("form-success")
    element.classList.remove("form-error")
  }

  hideError(element) {
    element.classList.remove("form-error", "form-success")
    if (element.classList.contains("hidden") === false) {
      element.classList.add("hidden")
    }
  }

  // Validar formulario antes de enviar
  validateForm(event) {
    const form = event.target.closest("form")
    const emailInput = form.querySelector('input[type="email"]')
    const passwordInput = form.querySelector('input[name*="[password]"]')
    const confirmationInput = form.querySelector('input[name*="[password_confirmation]"]')
    const termsCheckbox = form.querySelector('input[type="checkbox"]')
    
    let isValid = true

    if (!this.isValidEmail(emailInput.value)) {
      this.validateEmail({ target: emailInput })
      isValid = false
    }

    if (passwordInput.value.length < 6) {
      this.validatePassword({ target: passwordInput })
      isValid = false
    }

    if (confirmationInput && passwordInput.value !== confirmationInput.value) {
      this.validatePasswordConfirmation({ target: confirmationInput })
      isValid = false
    }

    if (termsCheckbox && !termsCheckbox.checked) {
      isValid = false
      // Mostrar error para términos
      const termsError = document.createElement('div')
      termsError.className = 'mt-1 text-sm text-red-600'
      termsError.textContent = 'You must agree to the terms and conditions.'
      termsCheckbox.parentNode.appendChild(termsError)
    }

    if (!isValid) {
      event.preventDefault()
      this.submitButtonTarget.classList.add("loading")
      setTimeout(() => {
        this.submitButtonTarget.classList.remove("loading")
      }, 2000)
    }
  }
} 