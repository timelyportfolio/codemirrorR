#' CodeMirror htmlwidget
#'
#' Create a {http://codemirror.net}{CodeMirror} editor for use
#' as an htmlwidgets for \code{rmarkdown}, \code{Shiny},
#' the R console, RStudio Viewer, 
#'
#' @param doc \code{character}, file or file path, or \code{xml2}
#'          document or nodeset
#' @param mode \code{character} specifying a {https://codemirror.net/doc/manual.html\#option_mode}{mode}
#' @param theme \code{character} specifying a {https://codemirror.net/doc/manual.html\#option_theme}{theme}
#' @param ... arguments for other CodeMirror {https://codemirror.net/doc/manual.html\#option_value}{options}
#' @param width,height any valid \code{CSS} size unit for the
#'          width and height of the container
#' @param elementId \code{character} for the unique id of the
#'          htmlwidget container;  likely \code{NULL} unless
#'          you need to customize
#'
#' @import htmlwidgets
#'
#' @export
codemirror <- function(
  doc = "",
  mode = NULL,
  theme = NULL,
  ...,
  width = "100%", height = NULL, elementId = NULL
) {
  
  # handle different doc types
  
  # handle files
  #   from DiagrammeR
  # check for a connection or file
  if (inherits(doc, "connection") ||
     (is.character(doc) && file.exists(doc))
  )  {
    doc <- readLines(doc, warn = FALSE)
  }
  
  # handle character
  if(is.character(doc)){
    doc <- paste0(doc, collapse = "\n")
  }
  
  # handle xml from xml2
  #  from xmlview
  if (inherits(doc, "xml_nodeset")) {
    doc <- paste0(as.character(doc), collapse="\n")
  } else if (inherits(doc, "xml_document") | inherits(doc, "xml_node")) {
    doc <- as.character(doc)
  }
  
  dependencies <- list()
  
  # check for mode and if available then add the dependency
  if (!is.null(mode)){
    dependencies[[length(dependencies)+1]] <- htmltools::htmlDependency(
      name = paste0("codemirror-",mode),
      version = "1.0.0",
      src = system.file(
        paste0(
          "htmlwidgets/lib/codemirror/mode/",
          mode
        ),
        package = "codemirrorR"
      ),
      script = paste0(mode,".js")
    )
  }
  
  # check for theme and if available then add the dependency
  if (!is.null(theme)){
    dependencies[[length(dependencies)+1]] <- htmltools::htmlDependency(
      name = paste0("codemirror-",theme),
      version = "1.0.0",
      src = system.file(
        "htmlwidgets/lib/codemirror/theme/",
        package = "codemirrorR"
      ),
      stylesheet = paste0(theme,".css")
    )
  }

  # forward options using x
  x = Filter(
    Negate(is.null),
    list(
      value = doc,
      mode = mode,
      theme = theme,
      ...
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'codemirror',
    x = x,
    width = width,
    height = height,
    package = 'codemirrorR',
    elementId = elementId,
    dependencies = dependencies
  )
}

#' Shiny bindings for codemirror
#'
#' Output and render functions for using codemirror within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \\code{'100\%'},
#'   \\code{'400px'}, \\code{'auto'}) or a number, which will be coerced to a
#'   string and have \\code{'px'} appended.
#' @param expr An expression that generates a codemirror
#' @param env The environment in which to evaluate \\code{expr}.
#' @param quoted Is \\code{expr} a quoted expression (with \\code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name codemirror-shiny
#'
#' @export
codemirrorOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'codemirror', width, height, package = 'codemirrorR')
}

#' @rdname codemirror-shiny
#' @export
renderCodemirror <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, codemirrorOutput, env, quoted = TRUE)
}