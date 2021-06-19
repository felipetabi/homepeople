// hola_controller.js
import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {

  saluda_denuevo(e){

    var value = e.target.value
    Rails.ajax({
      type: "get",
      url: "get-cities?region="+value,
      success: function(data){
        var select_comuna = document.getElementById("comuna");
        var options = document.querySelectorAll('#comuna option');
        options.forEach(o => o.remove());


        data.forEach(function(element){
          var option = document.createElement("option");
          option.text = element
          option.value = element
          select_comuna.add(option)
        });

      }
    })

    // alert("hola desde una funcion")
  }
}