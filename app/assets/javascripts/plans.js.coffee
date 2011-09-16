$(document).ready ->
  
  $("#plan_plan_type_id").live 'change', ->
    choice = $(this).val()
    choice = 0 if ( $(this).val() == '')
    submitBtn = $('#plan_form input[type="submit"]')
    if choice > 0
      submitBtn.removeAttr('disabled')
    else
      submitBtn.attr('disabled', 'disabled')
	  
  $("#filter_bar ul li a").click ->
    $( "#filter_bar ul li" ).removeClass( 'active' )
    $(this).parent().addClass('active') 
  
  $("#content.dashboard ul li.plan").mouseenter ->
    $(this).children("div.planActionBar:first").show()
    return
    
  $("#content.dashboard ul li.plan").mouseleave ->
    $(this).children("div.planActionBar:first").hide()
    return
