import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"
// Connects to data-controller="typed-js"

export default class extends Controller {
  connect() {

    new Typed(this.element, {
      strings: ["You want worry-free camping?", "This is your place!", "The best camping experience."],
      typeSpeed: 60,
      loop: true,
      cursorChar: "",
    });
  }

}
