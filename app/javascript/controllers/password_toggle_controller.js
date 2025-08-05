import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "button", "eyeIcon", "eyeSlashIcon"]

  connect() {
    console.log("Password toggle controller connected")
  }

  toggle() {
    const input = this.inputTarget
    const eyeIcon = this.eyeIconTarget
    const eyeSlashIcon = this.eyeSlashIconTarget

    if (input.type === "password") {
      input.type = "text"
      eyeIcon.classList.add("hidden")
      eyeSlashIcon.classList.remove("hidden")
    } else {
      input.type = "password"
      eyeIcon.classList.remove("hidden")
      eyeSlashIcon.classList.add("hidden")
    }
  }
} 