import Sortable from 'sortablejs';
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "card" ]


  connect() {
    const saveKanbanBinded = this.saveKanban.bind(null, this.cardTargets);
    this.cardTargets.forEach((card) => { // targets all cards
      new Sortable(card, { // makes'em sortable
          group: 'kanban', // set all lists to same group (to change columns)
          animation: 300,
          onEnd: saveKanbanBinded,
          onEnd: () => this.saveKanban('move') // saves position after move
      });
    });
  }

  kanbanForm(){
    document.querySelector(".kanban-form-input");
  }

  saveKanban(move) {
    // position storage model
    // {"columns": [
    //     { "id": 1, "itemIds": [3, 2] },
    //     { "id": 2, "itemIds": [4, 5] },
    //     { "id": 3, "itemIds": [6, 1] }
    //   ]}

    const kanbanIds = {"columns": []}; // estrutura que salva positions
    this.cardTargets.forEach(container => { // iterando sobre todos os cards debaixo do ctlr
      const itemIds = []; // init do array de positions por container
      console.log(container)

      container.querySelectorAll(".kanban-col-item") // select dos cards via classe
            // para cada card, lançar em itemIds sua position
        .forEach(card => itemIds.push(
          card
          // Number.parseInt(card.dataset.itemId,10)
          ));

      kanbanIds.columns.push(
        {
          // 'id': Number.parseInt(container.dataset.containerId,10),
          'id': container,
          'itemIds': itemIds
        });
    });
    // this.kanbanForm.value = JSON.stringify(kanbanIds);
    // this.kanbanForm.value = kanbanIds;
    this.kanbanForm.value = 22;
    console.log(kanbanIds);
    console.log(move)
  };
}
