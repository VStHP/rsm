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
    $('#edit_club_<%= params[:id] %>').remove();
    $('#info_club_<%= params[:id] %>').show();
  });
  $('.datepick').datepicker( {
    format: 'yyyy-mm-dd',
    startView: 'months'
  });
});
