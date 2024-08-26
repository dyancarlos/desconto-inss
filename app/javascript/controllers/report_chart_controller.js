import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from 'chart.js';

export default class extends Controller {
  static targets = ['salaryRangeChart']

  connect() {
    Chart.register(...registerables);

    var labels = this.salaryRangeChartTarget.dataset.label.split(';')
    var data = this.salaryRangeChartTarget.dataset.data.split(';')

    new Chart("salaryRangeChart", {
      type: "bar",
      data: {
	labels: labels,
	datasets: [{
	  data: data
	}]
      },
      options: {
	plugins: {
          legend: {
            display: false
          }
        }
      }
    });
  }
}
