$(function () {
  $('a[data-method="delete"]').on('ajax:success',
    function(elem, data, status, xhr){
      $("#video_" + data.id).remove()
  });  
});

