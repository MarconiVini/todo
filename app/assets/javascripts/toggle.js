$(document).on('ready page:load', function () {
  
  $.fn.bootstrapSwitch.defaults.size = 'mini';
  $.fn.bootstrapSwitch.defaults.onText = 'Show Finished'
  $.fn.bootstrapSwitch.defaults.offText = 'Off'
  $.fn.bootstrapSwitch.defaults.onColor = 'success';
  $.fn.bootstrapSwitch.defaults.offColor = 'info';

  toggle_status = ($("#show_toggle").val() == "false") ? false : true;

  $('.toggleswitch').bootstrapSwitch('state', toggle_status);

  $('.toggleswitch').on('switchChange.bootstrapSwitch', function(event, state) {
    project_id = $('#project_id').val();
    url = "/projects/" + project_id + "/toggle_show_old";

    $.ajax({
      type: "POST",
      url: url,
      success: success,
      error: error,
      dataType: "text"
    });

    function success(data){
      window.location = window.location;
    }
    function error(){
      alert("Could not update the show status");
    }
  });
});
