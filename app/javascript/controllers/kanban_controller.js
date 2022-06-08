import Sortable from 'sortablejs';
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "card" ]

  saveKanban(attributes) {
    console.log(attributes)
  };

  connect() {
    this.cardTargets.forEach((card) => {
      new Sortable(card, {
          group: 'kanban', // set both lists to same group
          animation: 300,
          onEnd: this.saveKanban
      });
    });

  }

}
