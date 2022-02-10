import { Modal } from 'bootstrap'

let modalTarget = document.getElementById('countryImage');
let modal

modalTarget.addEventListener('show.bs.modal', function (event) {
  console.log(event);
  modal = Modal.getInstance(modalTarget);
})

modalTarget.addEventListener('hidden.bs.modal', function (event) {
  console.log(event);
  modal.dispose();
})
