$('.nx').dblclick(function(){
  $(this).replaceWith('<i class="fa fa-heart mx"></i>');
  $('.mx').show().addClass('animated rubberBand');
});

$('.nz').click(function(){
  alert('Not Working :p');
});


//-----------------------------



var el14 = items[13].querySelector('button.icobutton'), el14span = el14.querySelector('span'), el14counter = el14.querySelector('span.icobutton__text');
new Animocon(el14, {
  tweens : [
    // ring animation
    new mojs.Shape({
      parent: el14,
      duration: 750,
      type: 'circle',
      radius: {0: 40},
      fill: 'transparent',
      stroke: '#F35186',
      strokeWidth: {35:0},
      opacity: 0.2,
      top: '45%',
      easing: mojs.easing.bezier(0, 1, 0.5, 1)
    }),
    new mojs.Shape({
      parent: el14,
      duration: 500,
      delay: 100,
      type: 'circle',
      radius: {0: 20},
      fill: 'transparent',
      stroke: '#F35186',
      strokeWidth: {5:0},
      opacity: 0.2,
      x : 40,
      y : -60,
      easing: mojs.easing.sin.out
    }),
    new mojs.Shape({
      parent: el14,
      duration: 500,
      delay: 180,
      type: 'circle',
      radius: {0: 10},
      fill: 'transparent',
      stroke: '#F35186',
      strokeWidth: {5:0},
      opacity: 0.5,
      x: -10,
      y: -80,
      isRunLess: true,
      easing: mojs.easing.sin.out
    }),
    new mojs.Shape({
      parent: el14,
      duration: 800,
      delay: 240,
      type: 'circle',
      radius: {0: 20},
      fill: 'transparent',
      stroke: '#F35186',
      strokeWidth: {5:0},
      opacity: 0.3,
      x: -70,
      y: -10,
      easing: mojs.easing.sin.out
    }),
    new mojs.Shape({
      parent: el14,
      duration: 800,
      delay: 240,
      type: 'circle',
      radius: {0: 20},
      fill: 'transparent',
      stroke: '#F35186',
      strokeWidth: {5:0},
      opacity: 0.4,
      x: 80,
      y: -50,
      easing: mojs.easing.sin.out
    }),
    new mojs.Shape({
      parent: el14,
      duration: 1000,
      delay: 300,
      type: 'circle',
      radius: {0: 15},
      fill: 'transparent',
      stroke: '#F35186',
      strokeWidth: {5:0},
      opacity: 0.2,
      x: 20,
      y: -100,
      easing: mojs.easing.sin.out
    }),
    new mojs.Shape({
      parent: el14,
      duration: 600,
      delay: 330,
      type: 'circle',
      radius: {0: 25},
      fill: 'transparent',
      stroke: '#F35186',
      strokeWidth: {5:0},
      opacity: 0.4,
      x: -40,
      y: -90,
      easing: mojs.easing.sin.out
    }),
    // icon scale animation
    new mojs.Tween({
      duration : 1200,
      easing: mojs.easing.ease.out,
      onUpdate: function(progress) {
        if(progress > 0.3) {
          var elasticOutProgress = mojs.easing.elastic.out(1.43*progress-0.43);
          el14span.style.WebkitTransform = el14span.style.transform = 'scale3d(' + elasticOutProgress + ',' + elasticOutProgress + ',1)';
        }
        else {
          el14span.style.WebkitTransform = el14span.style.transform = 'scale3d(0,0,1)';
        }
      }
    })
  ],
  onCheck : function() {
    el14.style.color = '#F35186';
    el14counter.innerHTML = Number(el14counter.innerHTML) + 1;
  },
  onUnCheck : function() {
    el14.style.color = '#C0C1C3';
    var current = Number(el14counter.innerHTML);
    el14counter.innerHTML = current > 1 ? Number(el14counter.innerHTML) - 1 : '';
  }
}); 
