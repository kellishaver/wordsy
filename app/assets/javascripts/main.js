$(function() {

  setTimeout(function() {
    $('.flash-notice').fadeOut();
  }, 3000);

  $('body').on('click', '.filter-link', function(e) {
    e.preventDefault();
    var elem = $(this);
    $('.filter-link').removeClass('active');
    $(this).addClass('active');
    if(elem.data('letter') == 'all') {
      $('.entry-wrapper').show();
    } else {
      $('.entry-wrapper').hide();
      $('.entry-wrapper[data-starts-with="' +  elem.data('letter') + '"]').show();
    }
  }).on('click', '.entry', function(e) {
    e.preventDefault();
    $('#player').remove();
    $('body').append('<audio id="player"><source src="' + this.href + '"></source></audio>');
    player = document.getElementById("player");
    player.play();
  });
});