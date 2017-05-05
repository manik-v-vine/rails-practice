$(document).ready(function(){
  /*
    Adds a new user via an ajax call.
  */
  $("button").click(function(){
     var url_link = $(this);
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

   /*
    Updates the user information via an ajax call. 
   */
  $(".edit_button").click(function(){
    var edit_link = $(this).attr('href')
    $("#dialog").show();
    $.ajax({
      url: edit_link,
      type: 'get',
      success: function(response){
        $('#dialog').html(response.html);
        bindFormUpdate();
      }
    })
    return false;
  });

  /*
    Displays the user via an ajax request.
  */
  $(".show_button").click(function(){
    var show_link = $(this).attr('href')
    $("#dialog").show();
    $.ajax({
      url: show_link,
      type: 'get',
      success: function(response){
        $('#dialog').html(response.html);
      }
    })
    return false;
  });

  /*
    Deletes the user via an ajax call.
  */
  $(".delete_button").click(function(){
    var delete_link = $(this).attr('href');
    if (confirm('Do you want to delete the user')){
    $.ajax({
      url: delete_link,
      type: 'delete',
      success: function(response){
       $('.user_list').html(response.html);
      }
    })
  }
    return false;
  });
});

/*
    Function callback has been carried out for saving the new user's info via 
    an ajax call.
*/
function bindFormEvents(){
  $('#dialog .user_info').submit(function(){
    submitCreate($(this));
    return false;
  })
}

/*
    The following method binds the form submission followed by an 
    ajax call for saving the new user's info and updating the table with
    newly added user.
*/
function submitCreate(form){
  $("#dialog").hide();
  $.ajax({
    url: form.attr('action'),
    type: 'POST',
    data: form.serialize(),
    success: function(response){
      $('.user_list').html(response.html);
      return false;
    }
  })
}

/*
    Function callback has been carried out for updating the new user's info via 
    an ajax call.
*/
function bindFormUpdate(){
  $('#dialog .edit_info').submit(function(){
    updateForm($(this));
    return false;
  })
}

/*
    The following method binds the form submission followed by an 
    ajax call for updating the user info and updating the table with
    newly added user.
*/
function updateForm(form){
  $("#dialog").hide();
  $.ajax({
    url: form.attr('action'),
    type: 'PUT',
    data: form.serialize(),
    success: function(response){
      $('.user_list').html(response.html);
      return false;
    }
  })
}
