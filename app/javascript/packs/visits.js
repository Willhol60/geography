import { Modal } from 'bootstrap'

const modalTarget = document.getElementById('countryImage');
let modal

modalTarget.addEventListener('show.bs.modal', function (event) {
  console.log(event);
  modal = Modal.getInstance(modalTarget);
})

modalTarget.addEventListener('hide.bs.modal', function (event) {
  console.log(event);
  modal.dispose();
})
