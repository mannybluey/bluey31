
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
    if $(this).attr("width")
      customWidth = $(this).attr("width")
    else
      customWidth = 360
    
    popup = $(this)
    title = $(this).attr("title")
    dialog_form = $("<div id=\"dialog-form\">Loading form...</div>").dialog(
      title: title
      draggable: false
      resizable: false
      autoOpen: false
      width: customWidth
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

