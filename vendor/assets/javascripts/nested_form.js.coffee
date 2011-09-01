jQuery ($) ->
  $("form a.add_nested_fields").live "click", ->
    assoc = $(this).attr("data-association")
    content = $("#" + assoc + "_fields_blueprint").html()
    context = ($(this).closest(".fields").find("input:first").attr("name") or "").replace(new RegExp("[[a-z]+]$"), "")
    if context
      parent_names = context.match(/[a-z_]+_attributes/g) or []
      parent_ids = context.match(/(new_)?[0-9]+/g) or []
      i = 0
      while i < parent_names.length
        if parent_ids[i]
          content = content.replace(new RegExp("(_" + parent_names[i] + ")_.+?_", "g"), "$1_" + parent_ids[i] + "_")
          content = content.replace(new RegExp("(\\[" + parent_names[i] + "\\])\\[.+?\\]", "g"), "$1[" + parent_ids[i] + "]")
        i++
    regexp = new RegExp("new_" + assoc, "g")
    new_id = new Date().getTime()
    content = content.replace(regexp, "new_" + new_id)
    $(this).before content
    $(this).closest("form").trigger "nested:fieldAdded"
    false
  
  $("form a.remove_nested_fields").live "click", ->
    hidden_field = $(this).prev("input[type=hidden]")[0]
    hidden_field.value = "1"  if hidden_field
    $(this).closest(".fields").hide()
    $(this).closest("form").trigger "nested:fieldRemoved"
    false