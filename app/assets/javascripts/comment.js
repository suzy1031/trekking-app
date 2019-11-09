$(function() {
  function buildHTML(comment){
    var html =`<div class="comment-user">
                <a href="/users/${comment.user_id}">
                  <img class="comment-user__comment-picture" src="${comment.image}">
                </a>
                <div class="comment-user__name">
                  ${comment.user_name}
                </div>
              </div>
              <div class="comment-text-area">
                <p>${comment.text}</p>
              </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.detail-comment').append(html);
      $('textbox').val(' ');
      $('#new_comment')[0].reset();
      $('.form__submit').prop('disabled', false);
    })
    .fail(function() {
      alert('error');
    })
  })
})