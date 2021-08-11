$(() => {
  $(document).on('click', '.checkbox-icon', understand)
})

function understand() {
  let button = $('.user').find('.btn')
  if(button.is(':disabled')) {
    button.removeAttr('disabled')
} else {
    button.prop('disabled', true)
  }
}
