#' Code Folding for CodeMirror
#' 
#' Add code folding for your \code{codemirror} htmlwidget.  This is designed
#'   for easy piping with \code{magrittr} or \code{pipeR}.
#' 
#' @param cm_widget \code{codemirror} htmlwidget
#' @param fold_mode \code{character} for the type of folding.  Valid options
#'          are \code{"brace-fold"}, \code{"comment-fold"}, \code{"indent-fold"},
#'          \code{"markdown-fold"}, and \code{"xml-fold"}.
#'
#' @return \code{codemirror} htmlwidget
#' @export

cm_foldcode <- function(cm_widget = NULL, fold_mode = NULL){
  
  if(is.null(cm_widget) || !inherits(cm_widget,"codemirror")) {
    stop( "cm_widget should be a codemirror htmlwidget", call. = FALSE)
  }
  
  #  will not work properly without fold_mode so stop if missing
  #   or invalid
  if(is.null(fold_mode) || !is.character(fold_mode)) {
    stop( "please supply a valid fold-mode; see ?cm_foldcode", call. = FALSE)
  }
  
  if(!(fold_mode %in% c("brace-fold","comment-fold","indent-fold","markdown-fold","xml-fold"))){
    stop( "please supply a valid fold-mode; see ?cm_foldcode", call. = FALSE)
  }
  
  cm_widget$x$lineNumbers = TRUE
  cm_widget$x$foldGutter = TRUE
  cm_widget$x$gutters = c("CodeMirror-linenumbers", "CodeMirror-foldgutter")
  
  cm_widget$dependencies[[length(cm_widget$dependencies) + 1]] <- htmltools::htmlDependency(
    name = "codemirror-foldcode",
    version = "1.0.0",
    src = system.file(
      "htmlwidgets/lib/codemirror/addon/",
      package = "codemirrorR"
    ),
    script = "fold/foldcode.js"
  )
  
  cm_widget$dependencies[[length(cm_widget$dependencies) + 1]] <- htmltools::htmlDependency(
    name = "codemirror-foldgutter",
    version = "1.0.0",
    src = system.file(
      "htmlwidgets/lib/codemirror/addon/",
      package = "codemirrorR"
    ),
    script = "fold/foldgutter.js",
    stylesheet = "fold/foldgutter.css"
  )
  
  
  cm_widget$dependencies[[length(cm_widget$dependencies) + 1]] <- htmltools::htmlDependency(
    name = "xml-fold",
    version = "1.0.0",
    src = system.file(
      "htmlwidgets/lib/codemirror/addon/",
      package = "codemirrorR"
    ),
    script = paste0("fold/",fold_mode,".js")
  )
  
  
  cm_widget
}