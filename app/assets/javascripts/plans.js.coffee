
animate_progress = (meter_idx, percentage, append_hint) ->
  meter = $(".meter:eq(" + meter_idx + ")")
  stick = $(meter).find("img")
  stick.rotate -180
  stick.rotate animateTo: ((percentage / 100) * 180) - 180
  if append_hint
    hint = $("<div class=\"hint\">" + percentage + "%</div>")
    meter.append hint
    meter.hover (->
      hint.fadeIn()
    ), ->
      hint.fadeOut()

$(document).ready ->
  animate_progress 0, 30, true
  animate_progress 1, 50, false
  
  $(".dialog").live "click", (e) ->
    $('.ui-dialog').remove()
    e.preventDefault()
    url = $(this).attr("href")
    popup = $(this)
    title = $(this).attr("title")
    dialog_form = $("<div id=\"dialog-form\">Loading form...</div>").dialog(
      title: title
      draggable: false
      resizable: false
      autoOpen: false
      width: 360
      modal: true
      open: ->
        $(this).load url + " #content"      
    )
    dialog_form.dialog "open"

  $("#notifications").delay(5000).fadeOut 2000
  $("a[data-remote=\"true\"]").click ->
    original = $(this).html()
    $(this).html("Loading...").bind "ajax:complete", ->
      $(this).html original


updatePlanDays = ->
  $('.day:visible').each (idx) ->
    day = idx + 1
    $(this).find('span').text('Day ' + day)
    $(this).find('input[id$=_day]').attr('value', day)
    $(this).find('.fields').each (pos) ->
      $(this).find('input[id$=_position]').attr('value', pos)

updatePlanItems = ->
  $('.plan-item input[type=checkbox]:checked').closest('li').addClass('completed')
  $('.plan-item input[type=checkbox]:not(:checked)').closest('li').removeClass('completed')
  
    
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

  $('#new_plan')
    .bind('nested:fieldAdded', updatePlanDays)
    .bind('nested:fieldRemoved', updatePlanDays)

  updatePlanItems()
  $('.plan-item header input[type=checkbox]').click ->
    $.ajax
      url: $(this).attr('data-url')
      type: 'put'
      data:
        plan_item:
          completed: $(this).is(':checked')
        authenticity_token: $('meta[name=csrf-token]').attr('content')
      success: ->
        updatePlanItems()
      error: ->
        console.log('Error')
  

  scanMetrics = ->
    if ($(this).parent().find('.found').length == 0)
      $(this).parent().append('<span class="found" />')
    matches = $(this).attr('value').match(/([\d\.]+)\s*(\S[^,0-9]+)/g)
    if (matches isnt null)
      found = $(this).parent().find('.found')
      found.html('Found: ')
      found.append('<span>'+value+'</span>') for value in matches
    else
      $(this).parent().remove('.found')

  $('.add-exercise').bind 'ajax:complete', ->
    $('input[id$=_measurements]').keyup(scanMetrics)
    $('#new_plan_item').bind 'nested:fieldAdded', ->
      $('input[id$=_measurements]').keyup(scanMetrics)
