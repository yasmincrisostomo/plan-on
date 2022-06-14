import Rails from '@rails/ujs';
import Sortable from 'sortablejs';
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "card", "container" ]


  connect() {
    // const saveKanbanBinded = this.saveKanban.bind(null, this.cardTargets);
    this.containerTargets.forEach((container) => { // targets all containers
      new Sortable(container, { // makes'em sortable
          group: 'kanban', // set all lists to same group (to change columns)
          animation: 300,
          // onEnd: saveKanbanBinded,
          onEnd: () => this.savePosition() // saves position after move
      });
    });
  }

  savePosition() {
    const savedPosition = {};
    this.containerTargets.forEach((container) => {
      const cards = Array.from(container.querySelectorAll(".kanban-col-item"));
      savedPosition[container.dataset.containerId] = cards.map(card =>  card.dataset.cardId )
    })
    this.updatePosition(savedPosition);
  }

  updatePosition(input) {

    Rails.ajax({
      url: "/update_cards",
      type: "PATCH",
      dataType: 'json',
      data: JSON.stringify(input)
    })

  }

}
