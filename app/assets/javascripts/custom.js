$(document).on('turbolinks:load', function () {
  $('#new_message').on('keypress', function (e) {
    if (e && e.keyCode == 13){
      e.preventDefault();
      $(this).submit();
    }
  });
});

$(document).ready(function () {
  $('.reply-send').click(function(){
    $('#new_message').submit()
  });
  $('.message').scrollTop($(this).height());
  $(window).resize(function () {
    $('.bdfill').css('display', 'block');
  });
});
