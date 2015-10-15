(function() {
  $('.delayed-redirect').on('click', function() {
    var buildingId = $(this).data('building-id');
    swal({
      title: "Loading...", 
      text: "We are generating your report. This may take several minutes", 
      type: "info",
      showConfirmButton: false,
      allowOutsideClick: true
    });

    var startTime;
    if (performance && performance.now) {
      startTime = performance.now();
    }
    $.get('/api/v1/buildings/' + buildingId + '/deficiency_summary_report')
      .then(function(data) {
        var url = data.poll_url;
        poll(url, function() {
          var endTime;
          if (performance && performance.now) {
            endTime = performance.now();
          }

          var reportText = 'Your report is finished generating.'
          if (startTime && endTime) {
            reportText += ' It took ' + Math.round((endTime - startTime)/1000) + ' seconds to complete.'
          }
          swal({
            title: 'Done',
            text: reportText,
            type: 'success',
            confirmButtonText: 'Take me there'
          }, function() {
            window.location = data.report_url
          });
        });
      });
  });

  function poll(url, callback) {
    $.get(url)
      .then(function(data) {
        if (data.status == 'unfinished') {
          setTimeout(function() {
            poll(url, callback);
          }, 2000);
        } else {
          callback();
        }
      });
  }
})();