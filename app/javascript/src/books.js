$(() => {
  $(document).on('click', '.fa-plus', plus)
  $(document).on('click', '.fa-minus', minus)
  $(document).on('click', '#read_more', read_more)
})

function plus() {
  let input = $('.quantity-input')[0]
  let value = Number(input.value)
  input.value = value + 1
  let price = $('.col-xs-12').find('p')[0].textContent.substring(1) / value
  $('.col-xs-12').find('p')[0].textContent = '€' + parseFloat((value + 1) * price).toFixed(1)
}

function minus() {
  let input = $('.quantity-input')[0]
  let value = Number(input.value)
  if(value >= 2) {
    input.value = value - 1
    let price = $('.col-xs-12').find('p')[0].textContent.substring(1) / value
    $('.col-xs-12').find('p')[0].textContent = '€' + parseFloat((value - 1) * price).toFixed(1)
  }
}

function read_more() {
  $('.max-lines')[0].classList.remove('max-lines')
  $('#read_more').hide()
}
