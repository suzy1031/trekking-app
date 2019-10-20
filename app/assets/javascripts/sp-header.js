$(function() {
  $('.user-face').on('click',function() {
    $('.sidebar').toggle(500);
  })
  $('.fas.fa-user').click(function() {
    $('.sidebar').toggle(500);
  })

  $('.fa.fa-search').on('click',function(){
      $('.js-modal').fadeIn(100);
      return false;
  });
  $('.js-modal-close').on('click',function(){
      $('.js-modal').fadeOut(100);
      return false;
  });
});