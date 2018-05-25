# Comment helper methods
window.Comments = {
  showEditPane: (comment) ->
    editPane = $(comment).find(".comment-form")
    commentBody = $(comment).find(".comment-body")
    if editPane != null
      editPane.show()
      commentBody.hide()

  hideEditPane: (comment) ->
    editPane = $(comment).find(".comment-form")
    commentBody = $(comment).find(".comment-body")
    if editPane != null
      editPane.hide()
      commentBody.show()

  replaceBodyContent: (comment, contents) ->
    commentBody = comment.find(".comment-body")
    commentBody.empty()
    commentBody.append(contents)

  saveChanges: (action, bodyText) ->
    # Request
    $.ajax
      method: "PATCH"
      url: action
      dataType: 'json'
      data:
        comment:
          body: bodyText
      error: (data, textStatus, jqXHR) ->
        handleAjaxError(data, textStatus, jqXHR, "Error editing comment")
      success: (data, textStatus, jqXHR) ->
        comment = $("#"+data.commentAnchor)
        Comments.replaceBodyContent(comment, data.content)
        Comments.hideEditPane(comment)
}


# Temporary Error handler
handleAjaxError = (data, textStatus, jqXHR, message) ->
  console.log(message)
  console.log(data)
  console.log(textStatus)
  console.log(jqXHR)

# JQuery events
$ ->
  commentSelector = $(".user-comment")

  ## Show editor
  commentSelector.find("a[name='edit']").click ->
    parentComment = this.closest(".user-comment")
    Comments.showEditPane(parentComment)

  ## Cancel
  commentSelector.find("button[name='cancel']").click ->
    parentComment = this.closest(".user-comment")
    Comments.hideEditPane(parentComment)

  ## Save edited comment
  commentSelector.find("button[name='submit']").click ->
    dataForm = this.closest("form")
    action = $(dataForm).attr('action')
    bodyText = $(dataForm).find('#comment_body').val()
    Comments.saveChanges(action, bodyText)
