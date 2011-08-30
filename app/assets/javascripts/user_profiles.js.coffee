$(document).ready ->
  
  $('.user-form').hide()
  $('#foundation.user-form').show()

  # User profile abs
  $('#user-tabs li a').click (event) ->
    form_name = $(this).attr('name')
    $('#user-tabs li').removeClass('selected')
    $(this).parent('li').addClass('selected')
    $('.user-form').hide()
    $("##{form_name}").show()
    event.preventDefault()


  $("#fondation_bottom input[name=commit]").click ->
    $("#foundation form").submit()
      
  $('#who_i_am input[type=checkbox]').click (e) ->
    utid = 'ut_' + $(this).attr('value')
    $("##{utid}").toggle()
    n = $("#who_i_am input:checked").length
    i_am = $('#who_i_am p .notify')
    if n > 0 then i_am.hide() else i_am.show()
    return

  $('#what_i_want input[type=checkbox]').click (e) ->
    uwid = 'uw_' + $(this).attr('value')
    $("##{uwid}").toggle()
    n = $("#what_i_want input:checked").length
    i_want = $('#what_i_want p .notify')
    if n > 0 then i_want.hide() else i_want.show()
    return

  $('#foundation_right input[id=user_profile_name]').change (e) ->
    $('#top_personal_data_left h2').html($(this).val())

  $('#foundation_right textarea[id=user_profile_summary]').change (e) ->
    $('#bottom_personal_data_summary p').html($(this).val())
    summary = $('#bottom_personal_data_summary')
    if $(this).val().length > 0 then summary.show() else summary.hide()
    return
    
  $('#foundation_right input[id=user_profile_gym]').change (e) ->
    $('#bottom_user_profile_bar li span.gym').html($(this).val())
    gym = $('#bottom_user_profile_bar li.gym')
    if $(this).val().length > 0 then gym.show() else gym.hide()
    return

  $('#foundation_right textarea[id=user_profile_sports]').change (e) ->
    $('#bottom_user_profile_bar li span.sports').html($(this).val())
    sports = $('#bottom_user_profile_bar li.sports')
    if $(this).val().length > 0 then sports.show() else sports.hide()
    return

  $('#foundation_right textarea[id=user_profile_brands]').change (e) ->
    $('#bottom_user_profile_bar li span.brands').html($(this).val())
    brands = $('#bottom_user_profile_bar li.brands')
    if $(this).val().length > 0 then brands.show() else brands.hide()
    return
    
  $('#foundation_left input[id=user_profile_city]').change (e) ->
    $('#bottom_personal_data_location span#city').html($(this).val())
    city = $('#bottom_personal_data_location span#city')
    if $(this).val().length > 0 then city.show() else city.hide()
    return

  $('#foundation_left select#user_profile_country').change (e) -> 
    selected_country = $('select#user_profile_country option:selected')
    selected_country_name = selected_country.html()
    selected_country_code = selected_country.val()
    display_country = $('#bottom_personal_data_location span#country')
    display_country.html(selected_country_name)
    if selected_country_code.length > 0 then display_country.show() else display_country.hide()
    return
 
  $('#foundation_left select#user_profile_dob_1i').change (e) ->
    selected_dob_year = $('#foundation_left select#user_profile_dob_1i option:selected').val()
    this_year = new Date().getFullYear()
    age = this_year - selected_dob_year
    display_age = $('#bottom_personal_data span#age')
    display_age.html(age + ' years - ')
    if age > 0 then display_age.show() else display_age.hide()
    return
    
  event.preventDefault()

