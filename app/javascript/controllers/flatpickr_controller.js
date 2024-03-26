import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"





const French = {
  firstDayOfWeek: 1,
  weekdays: {
    shorthand: ["DIM", "LUN", "MAR", "MER", "JEU", "VEN", "SAM"],
    longhand: [
      "Dimanche",
      "Lundi",
      "Mardi",
      "Mercredi",
      "Jeudi",
      "Vendredi",
      "Samedi",
    ],
  },
  months: {
    shorthand: [
      "JANV",
      "FÉVR",
      "MARS",
      "AVR",
      "MAI",
      "JUIN",
      "JUIL",
      "AOÛT",
      "SEPT",
      "OCT",
      "NOV",
      "DÉC",
    ],
    longhand: [
      "Janvier",
      "Février",
      "Mars",
      "Avril",
      "Mai",
      "Juin",
      "Juillet",
      "Août",
      "Septembre",
      "Octobre",
      "Novembre",
      "Décembre",
    ],
  },
  ordinal: (nth) => {
    if (nth > 1) return "";
    return "er";
  },
  rangeSeparator: " au ",
  weekAbbreviation: "Sem",
  scrollTitle: "Défiler pour augmenter la valeur",
  toggleTitle: "Cliquer pour basculer",
  time_24hr: true,
};
// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      position: "above",
      mode: "range",
      locale: French,
      dateFormat: "d-m-Y",
      closeOnSelect: true,
      onChange: (selectedDates) => {
        if (selectedDates.length === 1) {
          document.getElementById('date-difference').innerText = '';
          document.getElementById('end-date-input').value = selectedDates[1];
        } else {
          this.calculateDateDifference(selectedDates);
        }
      }
    });
  }


  calculateDateDifference(selectedDates) {
    if (selectedDates.length === 2) {

      const dateDifference = Math.abs(selectedDates[0] - selectedDates[1]) / (1000 * 60 * 60 * 24);
      console.log(dateDifference);
      document.getElementById('date-difference').innerText = `${dateDifference} jours`;
    }

  }



}
