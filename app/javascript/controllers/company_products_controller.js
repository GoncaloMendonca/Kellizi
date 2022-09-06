import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static values = { hash: String }
  static targets = [ "product" ]

  updateProducts(event) {
    const company_id = event.currentTarget.value;
    const productsHash = JSON.parse(this.hashValue.replace( /=>/g, ":" ))
    const company_products = productsHash[company_id]

    for (let option of this.productTarget.options) {
      if(company_products.hasOwnProperty(option.value)) {
        option.classList.remove("d-none")
      } else {
        option.classList.add("d-none")
      }
    }
  }
}
