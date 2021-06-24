#' @export
avatar <- function(...) {
  reactR::React$Avatar(...)
}

#' @import htmlwidgets
#'
#' @export
user_card <- function(size, owner_id, width = NULL, height = NULL) {

  # describe a React component to send to the browser for rendering.
  component <- reactR::component(
    "UserCard",
    list(size = size, ownerId = owner_id)
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'user_card',
    reactR::reactMarkup(component),
    width = width,
    height = height,
    package = 'shiny.synapse.react.client',
    elementId = elementId
  )
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @noRd
widget_html.user_card <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}

#' Shiny bindings for user_card
#'
#' Output and render functions for using user_card within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a user_card
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name user_card-shiny
#'
#' @export
user_cardOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'user_card', width, height, package = 'shiny.synapse.react.client')
}

#' @rdname user_card-shiny
#' @export
renderUser_card <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, user_cardOutput, env, quoted = TRUE)
}

