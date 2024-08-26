import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['discountField'];

  calculateDiscount() {
    this.discountFieldTarget.innerHTML = 10;
  }
}
