/*
  Javascript file for managing the application behaviour 
  like ajax requests etc.
*/
$(document).ready(function(){
  /*
    Adds a new user via an ajax call.
  */
  $("button").click(function(){
    $("#dialog").show();
    $.ajax({
      url: '/users/new',
      type: 'get',
      success: function(response){
        $('#dialog').html(response.html);
        bindFormEvents();
      },
      error: function(response){
       alert('There is some error');
      }
    })
  });

   /*
    Updates the user information via an ajax call. 
   */
  $(".edit_button").click(function(){
    var edit_link = $(this).attr('href');
    $("#dialog").show();
    $.ajax({
      url: edit_link,
      type: 'get',
      success: function(response){
        $('#dialog').html(response.html);
        bindFormUpdate();
      },
      error: function(){
        alert('There is some error');
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
      },
      error: function(){
        alert('There is some error');
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
      },
      error: function(){
        alert('There is some error');
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
      var first_name = $('#first_name').val();
      var last_name = $('#last_name').val();
      var email_check = $('#email').val().indexOf('@');
      if(first_name.length > 0 && last_name.length > 0 && email_check > -1){
        submitCreate($(this));
        return false;
      }
      else{ 
        $('#dialog').animate({height: '500px'})
       
        if($('.validation').length >= 1){
          $('.validation').html('');
        }
        if(first_name.length == 0){
              $('#first_name').after("<div class='validation'" 
                + "style='color:red;margin-bottom: 10px;'><sup>*</sup>Please enter the first_name</div>");
        }
        if(last_name.length == 0){
              $('#last_name').after("<div class='validation'" 
                + "style='color:red;margin-bottom: 10px;'><sup>*</sup>Please enter the last_name</div>");
        }
        if(email_check == -1){
              $('#email').after("<div class='validation'" 
                + "style='color:red;margin-bottom: 10px;'><sup>*</sup>Please enter a valid email</div>");
        }
        return false;
      }
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
        $('#dialog').animate({height: '400px'})
        return false;
      },
      error: function(){
        alert('There is some error');
      }
  })
}

  /*
    Function callback has been carried out for updating the new user's info via 
    an ajax call.
  */
  function bindFormUpdate(){
    $('#dialog .edit_info').submit(function(){
      var first_name = $('#first_name').val();
      var last_name = $('#last_name').val();
      var email_check = $('#email').val().indexOf('@');
      if(first_name.length > 0 && last_name.length > 0 && email_check > -1){
        updateForm($(this));
        return false;
      }
      else{ 
        $('#dialog').animate({height: '500px'})
       
        if($('.validation').length >= 1){
          $('.validation').html('');
        }
        if(first_name.length == 0){
              $('#first_name').after("<div class='validation'" 
                + "style='color:red;margin-bottom: 10px;'><sup>*</sup>Please enter the first_name</div>");
        }
        if(last_name.length == 0){
              $('#last_name').after("<div class='validation'" 
                + "style='color:red;margin-bottom: 10px;'><sup>*</sup>Please enter the last_name</div>");
        }
        if(email_check == -1){
              $('#email').after("<div class='validation'" 
                + "style='color:red;margin-bottom: 10px;'><sup>*</sup>Please enter a valid email</div>");
        }
        return false;
      }
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
        $('#dialog').animate({height: '400px'});
        return false;
      },
      error: function(){
        alert('There is some error');
      }
    })
  }
