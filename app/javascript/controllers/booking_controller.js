import { Controller } from "stimulus"


export default class extends Controller {


  click_ajax(e){
    e.preventDefault();
    var element = e.target;
    element.addEventListener("ajax:success", (data) => {
      if (data.detail[0].response) {
        element.classList.add("hidden")
      }

    });
  }

  toggle(e){
    // debugger
    e.preventDefault();
    var element = e.target
    if (element.classList.contains('btn-primary')) {
      element.classList.remove('btn-primary')
      element.classList.add('btn-success')
      element.classList.add('active')
    } else {
      element.classList.remove('btn-success')
      element.classList.remove('active')
      element.classList.add('btn-primary')
    }
    var array = []
    var get_ids = document.getElementsByClassName("active")
    for (let index = 0; index < get_ids.length; index++) {
      const element = get_ids[index];
      array.push(element.dataset.value)
    }
    var input_values = array.join(",")
    var input = document.getElementById("schedule_ids")
    input.value = ""
    input.value = input_values
  }


}
