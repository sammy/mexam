$(document).ready(function() {
      $('[data-slider]').on('change.fndtn.slider', function(){
      $('.range-slider-handle').text($('[data-slider]').attr('data-slider')); 
    });
});

$(document).ready(function() {
  $("#chapter_exam_id").change(function() {
    // alert($("#chapter_exam_id option:selected").val());
    exam = $("select#chapter_exam_id option:selected").val();
    if(exam == "") exam="0";
    jQuery.get('/chapters/get_exam_chapters/'+exam, function(data){
      $("#exam_chapters").html(data);
      // alert(data);
    })
  })
});



