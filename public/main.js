$('.nx').dblclick(function(){
  $(this).replaceWith('<i class="fa fa-heart mx"></i>');
  $('.mx').show().addClass('animated rubberBand');
});

$('.nz').click(function(){
  alert('Not Working :p');
});
