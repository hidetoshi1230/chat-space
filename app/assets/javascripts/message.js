$(function(){
  function buildHTML(message){
    var addimage = "";
    if (message.image.url) {
      addimage = `<img class = "image_size", src="${ message.image.url }">`;
    }
    var html = `<div class="message" data-message-id="${ message.id }">
                  <div class="message--name">
                    ${ message.name }
                  </div>
                  <div class="message--date">
                    ${ message.date }
                  </div>
                  <div class="message--text">
                    ${ message.body }
                  </div>
                  <div class="message--image">
                    ${ addimage }
                  </div>
                </div>`
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chatspace__messages').append(html);
      $('.chatspace__messages').animate({scrollTop: $('.chatspace__messages')[0].scrollHeight}, 'fast');
      $('.chatspace__input--message').val('');
    })
    .fail(function(){
      alert('error');
    })
    return false;
  })

  var interval = setInterval(function() {
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
      $.ajax({
        url: location.href,
        data: { last_id: $('.message').last().data('message-id')},
        dataType: 'json',
      })
      .done(function(data) {
        var html = buildHTML(data);
        $('.chatspace__messages').append(html);
      })
      .fail(function() {
        alert('自動更新に失敗しました');
      })
    }
    else {
      clearInterval(interval);
    }
  }, 5000);
});
