$(document).on "turbolinks:load", ->
  $(document).on "click", "#comments-link", (event) ->
    event.preventDefault()
    parentComment = $(this).closest(".comments")
    parentComment.find(".comment-link-form").hide()
    parentComment.find(".comment-form").fadeIn( "slow" )
    parentComment.find(".comment-form textarea").focus()
