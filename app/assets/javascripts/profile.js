$(document).on('click', '#club_cancel',function(){
    $('#new_club').remove();
    $('#btn-add-club').show();
    $('#edit_club_<%= params[:id] %>').remove();
    $('#info_club_<%= params[:id] %>').show();
});
$(document).on('click', '#club_current',function(){

    if ($('#club_end_time').attr('disabled')) {
      $('#club_end_time').removeAttr('disabled');
    }
    else {
      $('#club_end_time').attr({disabled:'disabled'});
    }
});
$(document).on('turbolinks:load', function() {
  $('.datepick').datepicker( {
    format: 'dd-mm-yyyy',
    startView: 'months'
  });
});
