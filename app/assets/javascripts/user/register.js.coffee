# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  $(document).ready(()->
    $("#email").focus();
  )

  $("#email").live("keydown", () -> 
    setTimeout(validate_email, 10)
    )
  
  $("#email").live("change", () -> 
    setTimeout(validate_email, 10)
    )

  $("#password").live("keydown", () -> 
    setTimeout(validate_password, 10) 
    )

  $("#password_confirmation").live("keydown", () -> 
    setTimeout(validate_password_confirmation, 10)
    )

  $("#next_to_step2").live("click", () -> 
     setTimeout(validate_step1, 10)
     )

  $("#last_name").live("keydown", () -> 
     setTimeout(validate_last_name, 10)
     )

  $("#first_name").live("keydown", () -> 
     setTimeout(validate_first_name, 10)
     )

  $("#middle_name").live("keydown", () -> 
     setTimeout(validate_middle_name, 10)
     )

  $("#next_to_step3").live("click", () -> 
     setTimeout(validate_step2, 10)
     )

  $("#next_to_step4").live("click", () -> 
     setTimeout(validate_step3, 10)
     )

  $("#faculty").live("change", () -> 
    setTimeout(change_faculty, 10)
    )

  $("#phone").live("keydown", () -> 
     setTimeout(validate_phone, 10)
     )

  $("#room").live("keydown", () -> 
     setTimeout(validate_room, 10)
     )

  validate_email = ()->
    if $("#email").val()
      reg = /^([a-z0-9_\-]+\.)*[a-z0-9_\-]+\@([a-z0-9][a-z0-9\-]*[a-z0-9]\.)+[a-z]{2,4}$/i;
      val = $("#email").val();
      if reg.test(val)
        jQuery.post('/register/validate_uniqueness_email', {email: $("#email").val()},(data)->
          (if data != "true"
             $("#td_email").css("background", "red"); 
             $("#error_email").text("пользователь с таким email уже зарегистрирован");
           else  
             $("#td_email").css("background", "green");
             $("#error_email").text("")));
       else
         $("#td_email").css("background","red");
         $("#error_email").text("некорректный email");
    else
      $("#td_email").css("background", "white");
      $("#error_email").text("");

  validate_password = ()->
    $("#td_password").css("background", "white");
    $("#error_password").text("");
    $("#td_password_confirmation").css("background", "white");
    $("#error_password_confirmation").text("");
    if $("#password_confirmation").val()
      if $("#password").val()
        reg = /^([a-z0-9])+$/i;
        val = $("#password").val();
        if reg.test(val)
          if $("#password").val().length >= 5
            if $("#password").val().length <= 30
              $("#td_password").css("background", "green");
              if $("#password").val() == $("#password_confirmation").val()
                $("#td_password").css("background", "green");
                $("#td_password_confirmation").css("background", "green");
              else
                $("#td_password_confirmation").css("background", "red");
                $("#error_password_confirmation").text("пароли не совпадают");
            else
              $("#td_password").css("background", "red");
              $("#error_password").text("пароль слишком длинный");
          else
            $("#td_password").css("background", "red");
            $("#error_password").text("пароль слишком короткий");
        else
          $("#td_password").css("background", "red");
          $("#error_password").text("пароль должен состоять только из латинских букв и цифр");
      else
        $("#td_password_confirmation").css("background", "red");
        $("#error_password_confirmation").text("пароли не совпадают");
    else
      if $("#password").val()
        reg = /^([a-z0-9])+$/i;
        val = $("#password").val();
        if reg.test(val)
          if $("#password").val().length >= 5
            if $("#password").val().length <= 30
              $("#td_password").css("background", "green");
              $("#error_password").text("");
            else
              $("#td_password").css("background", "red");
              $("#error_password").text("пароль слишком длинный"); 
          else
            $("#td_password").css("background", "red");
            $("#error_password").text("пароль слишком короткий"); 
        else
          $("#td_password").css("background", "red");
          $("#error_password").text("пароль должен состоять только из латинских букв и цифр");

  validate_password_confirmation = ()->
    if $("#password_confirmation").val()
      if $("#password").val()
        reg = /^([a-z0-9])+$/i;
        val = $("#password").val();
        if $("#password").val().length >= 5 && $("#password").val().length <= 30 && reg.test(val)
          if $("#password_confirmation").val() == $("#password").val()
            $("#td_password_confirmation").css("background", "green");
            $("#error_password_confirmation").text("");
          else
            $("#td_password_confirmation").css("background", "red");
            $("#error_password_confirmation").text("пароли не совпадают");
      else
        $("#td_password_confirmation").css("background", "red");
        $("#error_password_confirmation").text("пароли не совпадают");
    else
      $("#td_password_confirmation").css("background", "white");
      $("#error_password_confirmation").text("");

  validate_step1 = () ->
    if $("#email").val()
      if $("#td_email").css("backgroundColor") == "rgb(0, 128, 0)"
        if $("#password").val()
          if $("#td_password").css("backgroundColor") == "rgb(0, 128, 0)"
            if $("#password_confirmation").val()
              if $("#td_password_confirmation").css("backgroundColor") == "rgb(255, 0, 0)"
                $("#password_confirmation").focus(); 
            else
              $("#password_confirmation").focus(); 
              $("#td_password_confirmation").css("background", "red");
              $("#error_password_confirmation").text("подтвердите пароль"); 
          else
            $("#password").focus(); 
        else
          $("#password").focus(); 
          $("#td_password").css("background", "red");
          $("#error_password").text("введите пароль");      
      else
        $("#email").focus();
        if $("#password").val()
          if $("#td_password").css("backgroundColor") == "rgb(0, 128, 0)"
            if !$("#password_confirmation").val() 
              $("#td_password_confirmation").css("background", "red");
              $("#error_password_confirmation").text("подтвердите пароль"); 
        else
          $("#td_password").css("background", "red");
          $("#error_password").text("введите пароль");     
    else
      $("#email").focus(); 
      $("#td_email").css("background", "red");
      $("#error_email").text("введите email");
      if $("#password").val()
        if $("#td_password").css("backgroundColor") == "rgb(0, 128, 0)"
          if !$("#password_confirmation").val() 
            $("#td_password_confirmation").css("background", "red");
            $("#error_password_confirmation").text("подтвердите пароль"); 
      else
        $("#td_password").css("background", "red");
        $("#error_password").text("введите пароль");
 
  validate_last_name = ()->
    if $("#last_name").val()
      val = $("#last_name").val()
      reg = /^([а-я])+$/i
      if reg.test(val)
        if val.length > 30
          $("#td_last_name").css("background", "red");
          $("#error_last_name").text("фамилия слишком длинная");
        else
          $("#td_last_name").css("background", "green");
          $("#error_last_name").text("");
      else
        $("#td_last_name").css("background", "red");
        $("#error_last_name").text("фамилия введена некорректно");
    else
      $("#td_last_name").css("background", "white");
      $("#error_last_name").text("");
  
  validate_first_name = ()->
    if $("#first_name").val()
      val = $("#first_name").val()
      reg = /^([а-я])+$/i
      if reg.test(val)
        if val.length > 30
          $("#td_first_name").css("background", "red");
          $("#error_first_name").text("имя слишком длинное");
        else
          $("#td_first_name").css("background", "green");
          $("#error_first_name").text("");
      else
        $("#td_first_name").css("background", "red");
        $("#error_first_name").text("имя введено некорректно");
    else
      $("#td_first_name").css("background", "white");
      $("#error_first_name").text("");

  validate_middle_name = ()->
    if $("#middle_name").val()
      val = $("#middle_name").val()
      reg = /^([а-я])+$/i
      if reg.test(val)
        if val.length > 30
          $("#td_middle_name").css("background", "red");
          $("#error_middle_name").text("отчество слишком длинное");
        else
          $("#td_middle_name").css("background", "green");
          $("#error_middle_name").text("");
      else
        $("#td_middle_name").css("background", "red");
        $("#error_middle_name").text("отчество введено некорректно");
    else
      $("#td_middle_name").css("background", "white");
      $("#error_middle_name").text("");

  validate_step2 = () -> 
    if !$("#last_name").val()
      $("#td_last_name").css("background", "red");
      $("#error_last_name").text("введите фамилию");
    if !$("#first_name").val()
      $("#td_first_name").css("background", "red");
      $("#error_first_name").text("введите имя");
    if !$("#middle_name").val()
        $("#td_middle_name").css("background", "red");
        $("#error_middle_name").text("введите отчество");
    if $("#td_last_name").css("backgroundColor") != "rgb(0, 128, 0)"
      $("#last_name").focus();
    else if $("#td_first_name").css("backgroundColor") != "rgb(0, 128, 0)"
      $("#first_name").focus();
    else if $("#td_middle_name").css("backgroundColor") != "rgb(0, 128, 0)"
      $("#middle_name").focus();

  change_faculty = () ->
    faculty = $("select#faculty :selected").val();
    faculty = 0 unless faculty;
    jQuery.get('/register/user/update_chair_select/' + faculty, (data)->($("#chair").html(data);));
    
  validate_phone = ()->
    if $("#phone").val()
      val = $("#phone").val()
      reg = /^[0-9]{11}$/i
      if reg.test(val)
        $("#td_phone").css("background", "green");
        $("#error_phone").text("");
      else
        $("#td_phone").css("background", "red");
        $("#error_phone").text("неккоректный номер телефона");
    else
      $("#td_phone").css("background", "white");
      $("#error_phone").text("");

  validate_room = ()->
    if $("#room").val()
      $("#td_room").css("background", "green");
      $("#error_room").text("");
    else
      $("#td_room").css("background", "white");
      $("#error_room").text("");

  validate_step3 = ()->
    val = $("#phone").val()
    if val
      reg = /^[0-9]{11}$/i 
      if reg.test(val)
        $("#td_phone").css("background", "green");
        $("#error_phone").text("");
      else
        $("#td_phone").css("background", "red");
        $("#error_phone").text("неккоректный номер телефона");

  0




