$(document).ready ->
  
  onkeypress = "return event.keyCode!=13"

  $("[placeholder]").focus(->
    input = $(this)
    if input.val() == input.attr("placeholder")
      input.val ""
      input.removeClass "placeholder"
  ).blur(->
    input = $(this)
    if input.val() == "" or input.val() == input.attr("placeholder")
      input.addClass "placeholder"
      input.val input.attr("placeholder")
  ).blur().parents("form").submit ->
    $(this).find("[placeholder]").each ->
      input = $(this)
      input.val ""  if input.val() == input.attr("placeholder")
