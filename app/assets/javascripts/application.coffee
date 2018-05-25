require 'javascripts/articles'
require 'javascripts/comments'
require 'javascripts/welcome'

$(document).ajaxSend((e, xhr, options) ->
  token = $("meta[name='csrf-token']").attr("content");
  xhr.setRequestHeader("X-CSRF-Token", token);
)
