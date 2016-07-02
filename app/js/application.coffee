$ ->
  $div = $('<div>').prependTo('body')
  $result_div = $('<div class="dropdown">')
  $input = $('<input class="typeahead" type="text" placeholder="Search project" id="europa_filter" />').appendTo($result_div)

  $result_div.appendTo($div)
  $ul = $('<ul class="dropdown-menu">').appendTo($result_div)
  select = $('#P28_PROJECT_ID')[0]
  options = select.options
  found = []
  $input.on "keyup", (event)->
    val = this.value
    found.length = 0
    $ul.empty()
    $ul.css 'display', 'block'
    _.each options, (option)->
      jOption = $(option)
      label = jOption[0].label.toLowerCase()
      optionValue = jOption[0].value
      if val.length > 2 && label.indexOf(val.toLowerCase()) > -1
        found.push(jOption)
        li = $('<li>')
        li_a = $('<a class="typeahead_value">'+label+'</a>').appendTo(li)
        li_a.on 'click', ->
          $('#P28_PROJECT_ID').val(optionValue).trigger('onchange')
          evt = document.createEvent('HTMLEvents')
          evt.initEvent('change', false, true)
          document.getElementById('P28_PROJECT_ID').dispatchEvent(evt)
        li.appendTo($ul)
    if found.length == 0
      $ul.css 'display', 'none'
