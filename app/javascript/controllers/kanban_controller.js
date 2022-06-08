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
    // {container:1, cards: [3,2,4]}, {container:2, cards: [1,6,5]}
    const savedPosition = {};
    this.containerTargets.forEach((container) => {
      const cards = Array.from(container.querySelectorAll(".kanban-col-item"));
      savedPosition[container.dataset.containerId] = [cards.map(card =>  card.dataset.cardId )]
    })
    console.log(savedPosition);
  }

  kanbanForm(){
    document.querySelector(".kanban-form-input");
  }

  saveKanban(test_console) {
    // position storage model
    // {"columns": [
    //     { "id": 1, "itemIds": [3, 2] },
    //     { "id": 2, "itemIds": [4, 5] },
    //     { "id": 3, "itemIds": [6, 1] }
    //   ]}

    const kanbanIds = {"columns": []}; // estrutura que salva positions
    this.cardTargets.forEach(container => { // iterando sobre todos os cards debaixo do ctlr
      const itemIds = []; // init do array de positions por container

      container.querySelectorAll(".kanban-col-item") // select dos cards via classe
            // para cada card, lançar em itemIds sua position
        .forEach(card => itemIds.push(
          card.position
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
    this.kanbanForm.value = kanbanIds;
    // this.kanbanForm.value = 22;

    // console.log(kanbanIds);
    console.log(test_console)
  };
}
