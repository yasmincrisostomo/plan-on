import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true,
    enableTime: true,
    noCalendar: false,
    time_24hr: true
  });
}

export { initFlatpickr };
