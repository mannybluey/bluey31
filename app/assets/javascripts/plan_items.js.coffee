updatePlanDays = ->
  $(".day:visible").each (idx) ->
    day = idx + 1
    $(this).find("span").text "Day " + day
    $(this).find("input[id$=_day]").attr "value", day
    $(this).find(".fields").each (pos) ->
      $(this).find("input[id$=_position]").attr "value", pos

updatePlanItems = ->
  $(".plan-item input[type=checkbox]:checked").closest("li").addClass "completed"
  $(".plan-item input[type=checkbox]:not(:checked)").closest("li").removeClass "completed"

$(document).ready ->

  $("#new_plan").bind("nested:fieldAdded", updatePlanDays).bind "nested:fieldRemoved", updatePlanDays
  updatePlanItems()
  $(".plan-item header input[type=checkbox]").click ->
    $.ajax 
      url: $(this).attr("data-url")
      type: "put"
      data: 
        plan_item: completed: $(this).is(":checked")
        #authenticity_token: $("meta[name=csrf-token]").attr("content")
      success: ->
        updatePlanItems()
      error: ->
        console.log "Error"
  
  scanMetrics = ->
    $(this).parent().append "<span class=\"found\" />"  if $(this).parent().find(".found").length == 0
    matches = $(this).attr("value").match(/([\d\.]+)\s*(\S[^,0-9]+)/g)
    if matches != null
      found = $(this).parent().find(".found")
      found.html "Found: "
      _results = []
      _i = 0
      _len = matches.length
      
      while _i < _len
        value = matches[_i]
        _results.push found.append("<span>" + value + "</span>")
        _i++
      _results
    else
      $(this).parent().remove ".found"
  
  $(".add-plan-item").bind "ajax:complete", ->
    $("input[id$=_measurements]").keyup scanMetrics
    $("#new_plan_item").bind "nested:fieldAdded", ->
      $("input[id$=_measurements]").keyup scanMetrics
