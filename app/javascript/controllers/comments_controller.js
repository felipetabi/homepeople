import { Controller } from 'stimulus';
export default class extends Controller {
  static targets = ['rating', 'input_rating'];

  select_rating(e){
    e.preventDefault()
    var element = e.target
    var ratingTargets = this.ratingTargets
    ratingTargets.forEach(element => element.classList.remove("rating-active"));
    this.input_ratingTarget.value = element.dataset.value
    element.classList.add("rating-active")
  }

}