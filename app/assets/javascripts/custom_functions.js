$(document).ready(function() {
      $('[data-slider]').on('change.fndtn.slider', function(){
      $('.range-slider-handle').text($('[data-slider]').attr('data-slider')); 
    });
});
