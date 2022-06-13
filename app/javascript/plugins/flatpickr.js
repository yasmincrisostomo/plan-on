import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    noCalendar: false,
    dateFormat: "H:i",
    time_24hr: true
  });
}

export { initFlatpickr };
