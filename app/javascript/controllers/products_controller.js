import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["search", "productCard", "likeButton", "commentButton", "shareButton"]
  static values = { 
    productId: Number,
    likes: { type: Number, default: 0 },
    comments: { type: Number, default: 0 },
    shares: { type: Number, default: 0 }
  }

  connect() {
    console.log("Products controller connected")
  }

  // Búsqueda en tiempo real
  search() {
    const query = this.searchTarget.value.toLowerCase()
    
    this.productCardTargets.forEach(card => {
      const productName = card.querySelector('[data-product-name]')?.textContent.toLowerCase() || ''
      const productDesc = card.querySelector('[data-product-desc]')?.textContent.toLowerCase() || ''
      
      if (productName.includes(query) || productDesc.includes(query)) {
        card.style.display = 'block'
      } else {
        card.style.display = 'none'
      }
    })
  }

  // Funcionalidad de like
  like(event) {
    event.preventDefault()
    const button = event.currentTarget
    const countSpan = button.querySelector('span')
    const currentLikes = parseInt(countSpan.textContent)
    
    if (button.classList.contains('text-red-500')) {
      // Unlike
      button.classList.remove('text-red-500')
      button.classList.add('text-gray-500')
      countSpan.textContent = currentLikes - 1
    } else {
      // Like
      button.classList.remove('text-gray-500')
      button.classList.add('text-red-500')
      countSpan.textContent = currentLikes + 1
    }
  }

  // Funcionalidad de comentarios
  comment(event) {
    event.preventDefault()
    const button = event.currentTarget
    const countSpan = button.querySelector('span')
    const currentComments = parseInt(countSpan.textContent)
    
    // Simular agregar comentario
    countSpan.textContent = currentComments + 1
    
    // Mostrar notificación
    this.showNotification('Comentario agregado')
  }

  // Funcionalidad de compartir
  share(event) {
    event.preventDefault()
    const button = event.currentTarget
    const countSpan = button.querySelector('span')
    const currentShares = parseInt(countSpan.textContent)
    
    // Simular compartir
    countSpan.textContent = currentShares + 1
    
    // Mostrar notificación
    this.showNotification('Producto compartido')
  }

  // Mostrar notificación
  showNotification(message) {
    const notification = document.createElement('div')
    notification.className = 'fixed top-4 right-4 bg-green-500 text-white px-4 py-2 rounded-lg shadow-lg z-50'
    notification.textContent = message
    
    document.body.appendChild(notification)
    
    setTimeout(() => {
      notification.remove()
    }, 3000)
  }

  // Animación de carga
  loading() {
    this.element.classList.add('loading-pulse')
  }

  // Remover animación de carga
  loaded() {
    this.element.classList.remove('loading-pulse')
  }
} 