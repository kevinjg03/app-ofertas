import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "strength", "meter"]

  connect() {
    console.log("Password strength controller connected")
  }

  checkStrength(event) {
    const password = event.target.value
    const strength = this.strengthTarget
    const meter = this.meterTarget

    if (password.length === 0) {
      this.hideStrength()
      return
    }

    const score = this.calculateStrength(password)
    this.updateStrengthDisplay(score, strength, meter)
  }

  calculateStrength(password) {
    let score = 0

    // Longitud
    if (password.length >= 8) score += 1
    if (password.length >= 12) score += 1

    // Caracteres variados
    if (/[a-z]/.test(password)) score += 1
    if (/[A-Z]/.test(password)) score += 1
    if (/[0-9]/.test(password)) score += 1
    if (/[^A-Za-z0-9]/.test(password)) score += 1

    return score
  }

  updateStrengthDisplay(score, strengthElement, meterElement) {
    let strengthText = ""
    let strengthClass = ""
    let meterWidth = "0%"

    if (score <= 2) {
      strengthText = "Weak"
      strengthClass = "text-red-600"
      meterWidth = "25%"
    } else if (score <= 4) {
      strengthText = "Medium"
      strengthClass = "text-yellow-600"
      meterWidth = "50%"
    } else if (score <= 6) {
      strengthText = "Strong"
      strengthClass = "text-green-600"
      meterWidth = "75%"
    } else {
      strengthText = "Very Strong"
      strengthClass = "text-green-600"
      meterWidth = "100%"
    }

    strengthElement.textContent = strengthText
    strengthElement.className = `text-xs ${strengthClass}`
    
    if (meterElement) {
      meterElement.style.width = meterWidth
      meterElement.className = `h-1 rounded transition-all duration-300 ${
        score <= 2 ? 'bg-red-500' : 
        score <= 4 ? 'bg-yellow-500' : 'bg-green-500'
      }`
    }

    strengthElement.classList.remove("hidden")
  }

  hideStrength() {
    const strength = this.strengthTarget
    const meter = this.meterTarget

    strength.classList.add("hidden")
    if (meter) {
      meter.style.width = "0%"
    }
  }
} 