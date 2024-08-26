import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['salaryField', 'discountField'];

  calculateDiscount() {
    fetch(this.salaryFieldTarget.dataset.path + "?salary=" + this.salaryFieldTarget.value)
      .then(response => response.json())
      .then(json => this.discountFieldTarget.innerHTML = json.discount);
  }
}
