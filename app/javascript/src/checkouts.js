$(() => {
  $(document).on('click', '.checkbox-icon', address)
})

function address() {
  let form = $('#shipping_address_form')
  if(form.is(':visible')) {
    form.hide()
} else {
    form.show()
  }
}
