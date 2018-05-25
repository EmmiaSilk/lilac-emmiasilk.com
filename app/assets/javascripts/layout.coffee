window.flash_message = (level, message) ->
  container = $("#alert-container")

  flash = $("<div></div>")
  flash.append(message)
  flash.attr('class', 'alert-'+level + ' alert alert-dismissable fade show')
  flash.attr('role', 'alert')

  anchor = $('<a></a>');
  anchor.attr('role', 'button')
  anchor.attr('data-dismiss', 'alert')
  anchor.attr('aria-label', 'close')
  anchor.attr('class', 'close')
  anchor.append('<span>&times;</span>')
  flash.append(anchor)

  container.append(flash)
