$(document).on('turbolinks:load', function(){
  $(() => {
    $('[id^=star-]').on('mouseover', star_over)
    $('[id^=star-]').on('mouseout', star_out)
    $('[id^=star-]').on('click', star_click)
  })

  function star_over() {
    let value = this.id.substring(5)
    $(this).parent().find('.fa-star').each(function(){
      if(this.id.substring(5) <= value){
        $(this).removeClass('rate-empty')
      }
    })
  }

  function star_out() {
    let value = this.id.substring(5)
    $(this).parent().find('.fa-star').each(function(){
      if(this.id.substring(5) <= value && !this.value){
        $(this).addClass('rate-empty')
      }
    })
  }

  function star_click() {
    let value = this.id.substring(5)
    $(this).parent().find('.fa-star').each(function(){
      if(this.id.substring(5) <= value){
        $(this).removeClass('rate-empty')
        this.value = true
      } else {
        $(this).addClass('rate-empty')
        this.value = false
      }
    })
    $('#review_score')[0].value = Number(value) + 1
  }
})
