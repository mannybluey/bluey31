$(document).ready ->
  
  $("#plan_type").change (e) ->
    choice = $(this).val()
    choice = 0 if ( $(this).val() == '')
    $.get "/plan/#{choice}.js"
	  
  $("#navBar ul li a").click ->
    $( "#navBar ul li" ).removeClass( 'active' )
    $(this).parent().addClass('active') 
  
  $("#content.dashboard ul li.plan").mouseenter ->
    $(this).children("div.planActionBar:first").show()
    return
    
  $("#content.dashboard ul li.plan").mouseleave ->
    $(this).children("div.planActionBar:first").hide()
    return
