import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

export default class extends Controller {
  static targets = [ "form" ]

  connect() {
    // ...
  }

  submit(event) {
    event.preventDefault();

    fetch(this.formTarget.action, {
      method: this.formTarget.method,
      body: new FormData(this.formTarget),
      headers: {
        'X-Requested-With': 'XMLHttpRequest'
      }
    }).then(response => {
      if (response.ok) {
        Swal.fire({
          icon: 'success',
          title: 'Réservation réussie',
          showConfirmButton: false,
          timer: 1500
        }).then(() => {
          window.location = '/'; // pour rediriger vers la page d'accueil
        })
      } else {
        response.json().then(data => {
          Swal.fire({
            icon: 'error',
            title: 'Erreur de réservation',
            text: data.errors, // Assurez-vous que le serveur renvoie les erreurs dans le corps de la réponse
            showConfirmButton: true
          }).then(() => {
            window.history.back(); // pour revenir à la page précédente
          })
        })
      }
    })
  }
}
