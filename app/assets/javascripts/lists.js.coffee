$("document").ready ->
  $("input[type=checkbox]").change ->
    $.ajax
      url: $(this).data("url")
      type: "PATCH"
      data:
        todo:
          complete: true

      success: (e) ->
        $("p.notice").html e
        return

    $(this).closest(".todo_row").fadeOut()
    return

  return