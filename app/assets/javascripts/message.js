$(function(){
  function buildHTML(message){
    var html = `.message
                  .message--name
                    = ${ @message.user.name }
                  .message--date
                    = ${ @message.created_at }
                  .message--text
                    - if message.image?
                      = image_tag ${ @message.image.to_s }
                    - else
                      = ${ @message.body }`
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
      $('.chatspace__messages').append(html)
      $('.chatspace__input--message').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
});
