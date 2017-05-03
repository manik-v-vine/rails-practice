//  function showDialog(){
//    document.getElementById('dialog').show();
// }

$(document).ready(function(){

  $("button").click(function(){
    $("#dialog").show();
    $.ajax({
      url: '/users/new',
      type: 'get',
      success: function(response){
        $('#dialog').html(response.html);
        bindFormEvents();
      }
    })
  });

  $("#edit_button").click(function(){
    $("#dialog").show();
    $.ajax({
      url: '/users/#{:id}/edit',
      type: 'get',
      success: function(response){
        $('#dialog').replaceWith(response.html);
      }
    })
  });



});

function bindFormEvents(){
  $('#dialog .user_info').submit(function(){
    submitCreate($(this));
    return false;
  })
}

function submitCreate(form){
  $("#dialog").hide();
  $.ajax({
    url: form.attr('action'),
    type: 'post',
    data: form.serialize(),
    success: function(response){
      $('.user_list').html(response.html);
      return false;
    }
  })
}

// });
// function() {
//     var dialog = document.getElementById('dialog');
//     document.getElementById('button').onclick = function() {
//         alert(hello)
//     };
// };