# CodeMirror htmlwidget for R

This is an early version of a R [`htmlwidget`](http://htmlwidgets.org) version of [CodeMirror](https://codemirror.net) by [Marijn Haverbeke](https://marijnhaverbeke.nl/fund/).

## Installation

```
devtools::install_github("timelyportfolio/codemirrorR")
```

## Examples

### Simple

```
library(codemirrorR)

codemirror("hi")
```

### Mode

```
library(codemirrorR)

codemirror(
  "
  library(codemirror)
  
  codemirror('hi')
  ",
  mode = "r"
)
```

```
library(codemirrorR)

codemirror(
  system.file(
    "htmlwidgets/codemirror.js",
    package = "codemirrorR"
  ),
  mode = "javascript"
)
```

```
library(codemirrorR)
library(xml2)

# ?xml2::readxml
cd <- read_xml("http://www.xmlfiles.com/examples/cd_catalog.xml")

codemirror(cd, mode = "xml")
```

### Themes

```
library(codemirrorR)

codemirror(
  system.file(
    "htmlwidgets/codemirror.js",
    package = "codemirrorR"
  ),
  mode = "javascript",
  theme = "night"
)
```

### Addons

**will add much better support for addons**

```
library(codemirrorR)
library(xml2)

# ?xml2::readxml
cd <- read_xml("http://www.xmlfiles.com/examples/cd_catalog.xml")

cm <- codemirror(
  cd,
  mode = "xml",
  lineNumbers = TRUE
)

cm_foldcode(cm, "xml-fold")

# brace fold
library(pipeR)

codemirror(
  system.file(
    "htmlwidgets/codemirror.js",
    package = "codemirrorR"
  ),
  mode = "javascript",
  theme = "night"
) %>>% cm_foldcode("brace-fold")
```
