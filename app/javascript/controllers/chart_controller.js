import { Controller } from "stimulus"
import Chart from 'chart.js/auto';

export default class extends Controller {
  static values = {
    values: Object
  }
  static targets = ["button", "canvas"]

  connect() {
    const ctx = this.canvasTarget;
    const btn = this.buttonTarget;
    const dataObject = {
      labels: Object.keys(this.valuesValue),
      datasets: [{
        data: Object.values(this.valuesValue),
        backgroundColor: [
          'rgba(230, 99, 132, 0.2)',
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
          'rgba(230, 99, 132, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1
      }]
    }
    // if (window.location.href.includes("profiles")) {
    //   dataObject.labels = Object.keys(this.valuesValue);
    // }

    const chart = new Chart(ctx, {
      type: 'polarArea',
      data: dataObject,
      options: {
        responsive: true,
        scales: {
          r: {
            min: 0,
            max: 10,
          }
        },
        animation: {
          onComplete: () => {
            btn.addEventListener("click", () => {
              var a = document.createElement('a');
              a.href = chart.toBase64Image();
              a.download = 'wheel_of_life.png';

              // Trigger the download
              a.click();

            })
          }
        }
      },
    })
    console.log(this.valuesValue)
  }

}
