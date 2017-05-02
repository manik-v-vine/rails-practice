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
      }
    })
    });
});


$(document).ready(function(){
    $("#form").submit(function(){
      $("#dialog").close();
      $.ajax({
      url: form.attr('action'),
      type: 'post',
      data: form.serialize(),
      success: function(response){
        $('#table').html(response.html);
        return false;
      }
    })
    });
});


// });
// function() {
//     var dialog = document.getElementById('dialog');
//     document.getElementById('button').onclick = function() {
//         alert(hello)
//     };
// };