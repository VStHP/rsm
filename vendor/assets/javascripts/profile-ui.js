$(document).ready(function() {
  $('#club_current').click(function() {
    if ($('#club_end_time').attr('disabled')) {
      $('#club_end_time').removeAttr('disabled');
    }
    else {
      $('#club_end_time').attr({disabled:'disabled'});
    }
  });
  $('#club_cancel').click(function(){
    $('#new_club').remove();
    $('#btn-add-club').show();
  });
  $(".datepick").datepicker( {
    format: "mm-yyyy",
    startView: "months",
    minViewMode: "months"
  });
});
