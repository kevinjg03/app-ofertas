import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "submitButton", "termsCheckbox", "field"]
  static values = { 
    hasErrors: Boolean,
    isSubmitting: Boolean
  }

  connect() {
    console.log("Product form controller connected")
    this.validateForm()
  }

  // Validar el formulario
  validateForm() {
    const requiredFields = this.fieldTargets.filter(field => 
      field.hasAttribute('required') || field.classList.contains('required')
    )
    
    const isValid = requiredFields.every(field => field.value.trim() !== '')
    const termsAccepted = this.termsCheckboxTarget.checked
    
    this.submitButtonTarget.disabled = !isValid || !termsAccepted
    this.submitButtonTarget.classList.toggle('opacity-50', !isValid || !termsAccepted)
  }

  // Validar campo individual
  validateField(event) {
    const field = event.target
    const value = field.value.trim()
    const isValid = value !== ''
    
    // Remover clases de error
    field.classList.remove('border-red-500', 'focus:ring-red-500', 'focus:border-red-500')
    
    // Agregar clases de error si es inválido
    if (!isValid && field.hasAttribute('required')) {
      field.classList.add('border-red-500', 'focus:ring-red-500', 'focus:border-red-500')
    }
    
    this.validateForm()
  }

  // Manejar cambio en checkbox de términos
  toggleTerms(event) {
    this.validateForm()
  }

  // Manejar envío del formulario
  submit(event) {
    if (!this.termsCheckboxTarget.checked) {
      event.preventDefault()
      this.showNotification('Debes aceptar los términos para continuar', 'error')
      return
    }
    
    this.isSubmittingValue = true
    this.submitButtonTarget.classList.add('btn-loading')
    this.submitButtonTarget.textContent = this.submitButtonTarget.dataset.loadingText || 'Procesando...'
  }

  // Mostrar notificación
  showNotification(message, type = 'success') {
    const notification = document.createElement('div')
    const bgColor = type === 'error' ? 'bg-red-500' : 'bg-green-500'
    const textColor = 'text-white'
    
    notification.className = `fixed top-4 right-4 ${bgColor} ${textColor} px-4 py-2 rounded-lg shadow-lg z-50`
    notification.textContent = message
    
    document.body.appendChild(notification)
    
    setTimeout(() => {
      notification.remove()
    }, 3000)
  }

  // Auto-resize textarea
  resizeTextarea(event) {
    const textarea = event.target
    textarea.style.height = 'auto'
    textarea.style.height = textarea.scrollHeight + 'px'
  }

  // Formatear presentación automáticamente
  formatPresentation(event) {
    const field = event.target
    let value = field.value.toLowerCase()
    
    // Detectar unidades comunes
    const units = ['ml', 'l', 'kg', 'g', 'oz', 'lb', 'pcs', 'unidades']
    const detectedUnit = units.find(unit => value.includes(unit))
    
    if (detectedUnit) {
      // Formatear con la unidad detectada
      const number = value.replace(detectedUnit, '').trim()
      if (number && !isNaN(number)) {
        field.value = `${number} ${detectedUnit}`
      }
    }
  }

  // Sugerencias de categorías
  showCategorySuggestions(event) {
    const field = event.target
    const value = field.value.toLowerCase()
    
    // Aquí podrías implementar sugerencias dinámicas
    // Por ahora solo validamos que no esté vacío
    this.validateField(event)
  }

  // Limpiar formulario
  resetForm() {
    this.fieldTargets.forEach(field => {
      field.value = ''
      field.classList.remove('border-red-500', 'focus:ring-red-500', 'focus:border-red-500')
    })
    
    this.termsCheckboxTarget.checked = false
    this.validateForm()
  }

  // Desconectar
  disconnect() {
    this.isSubmittingValue = false
  }
} 