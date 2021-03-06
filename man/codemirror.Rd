% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/codemirror.R
\name{codemirror}
\alias{codemirror}
\title{CodeMirror htmlwidget}
\usage{
codemirror(doc = "", mode = NULL, theme = NULL, ..., width = NULL,
  height = NULL, elementId = NULL)
}
\arguments{
\item{doc}{\code{character}, file or file path, or \code{xml2}
document or nodeset}

\item{mode}{\code{character} specifying a {https://codemirror.net/doc/manual.html\#option_mode}{mode}}

\item{theme}{\code{character} specifying a {https://codemirror.net/doc/manual.html\#option_theme}{theme}}

\item{...}{arguments for other CodeMirror {https://codemirror.net/doc/manual.html\#option_value}{options}}

\item{width, height}{any valid \code{CSS} size unit for the
width and height of the container}

\item{elementId}{\code{character} for the unique id of the
htmlwidget container;  likely \code{NULL} unless
you need to customize}
}
\description{
Create a {http://codemirror.net}{CodeMirror} editor for use
as an htmlwidgets for \code{rmarkdown}, \code{Shiny},
the R console, RStudio Viewer,
}

