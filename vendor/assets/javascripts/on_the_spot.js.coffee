$(document).ready ->
  $(".on_the_spot_editing").each (n) ->
    el = $(this)
    auth_token = el.attr("data-auth")
    data_url = el.attr("data-url")
    ok_text = el.attr("data-ok") or "OK"
    cancel_text = el.attr("data-cancel") or "Cancel"
    tooltip_text = el.attr("data-tooltip") or "Click to edit ..."
    edit_type = el.attr("data-edittype")
    select_data = el.attr("data-select")
    rows = el.attr("data-rows")
    columns = el.attr("data-columns")
    load_url = el.attr("data-loadurl")
    options = 
      tooltip: tooltip_text
      placeholder: tooltip_text
      cancel: cancel_text
      submit: ok_text
      onerror: (settings, original, xhr) ->
        original.reset()
        alert xhr.responseText
      
      submitdata: 
        authenticity_token: auth_token
        _method: "put"
    
    options.type = edit_type  if edit_type?
    if edit_type == "select"
      if select_data?
        options.data = select_data
        options.submitdata = select_array: select_data
      options.loadurl = load_url  if load_url?
    else if edit_type == "textarea"
      options.rows = rows
      options.cols = columns
    el.editable data_url, options