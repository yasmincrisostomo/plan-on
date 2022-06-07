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
          onEnd: this.saveKanban,
          store: {
            /**
             * Get the order of elements. Called once during initialization.
             * @param   {Sortable}  sortable
             * @returns {Array}
             */
            get: function (sortable) {
              var order = localStorage.getItem(sortable.options.group.name);
              return order ? order.split('|') : [];
            },

            /**
             * Save the order of elements. Called onEnd (when the item is dropped).
             * @param {Sortable}  sortable
             */
            set: function (sortable) {
              var order = sortable.toArray();
              localStorage.setItem(sortable.options.group.name, order.join('|'));
            }
          }
      });
    });

  }

}
