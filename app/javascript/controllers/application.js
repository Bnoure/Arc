import { Application } from "@hotwired/stimulus"
import Swal from 'sweetalert2';
window.Swal = window.validateForm = function validateForm() {
  let capacity = document.getElementById('capacity-input').value;
  let startDate = document.getElementById('start-date-input').value;
  let endDate = document.getElementById('end-date-input').value;

  if (!capacity || !startDate || !endDate) {
    Swal.fire({
      icon: 'error',
      title: 'Oops...',
      text: 'Veuillez remplir tous les champs requis!',
    });
    return false;
  }

  return true;
}



const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
