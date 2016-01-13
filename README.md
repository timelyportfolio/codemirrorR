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
  paste0(
    readLines(
      system.file(
        "htmlwidgets/codemirror.js",
        package = "codemirrorR"
      )
    ),
    collapse = "\n"
  ),
  mode = "javascript"
)
```

```
library(codemirrorR)
library(xml2)

# ?xml2::readxml
cd <- read_xml("http://www.xmlfiles.com/examples/cd_catalog.xml")

codemirror(
  as.character(cd),
  mode = "xml"
)
```

### Themes

```
library(codemirrorR)

codemirror(
  paste0(
    readLines(
      system.file(
        "htmlwidgets/codemirror.js",
        package = "codemirrorR"
      )
    ),
    collapse = "\n"
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
  as.character(cd),
  mode = "xml",
  lineNumbers = TRUE,
  foldGutter = TRUE,
  gutters = c("CodeMirror-linenumbers", "CodeMirror-foldgutter")
)

cm$dependencies[[length(cm$dependencies) + 1]] <- htmltools::htmlDependency(
  name = "codemirror-foldcode",
  version = "1.0.0",
  src = system.file(
    "htmlwidgets/lib/codemirror/addon/",
    package = "codemirrorR"
  ),
  script = "fold/foldcode.js"
)

cm$dependencies[[length(cm$dependencies) + 1]] <- htmltools::htmlDependency(
  name = "codemirror-foldgutter",
  version = "1.0.0",
  src = system.file(
    "htmlwidgets/lib/codemirror/addon/",
    package = "codemirrorR"
  ),
  script = "fold/foldgutter.js",
  stylesheet = "fold/foldgutter.css"
)

cm$dependencies[[length(cm$dependencies) + 1]] <- htmltools::htmlDependency(
  name = "xml-fold",
  version = "1.0.0",
  src = system.file(
    "htmlwidgets/lib/codemirror/addon/",
    package = "codemirrorR"
  ),
  script = "fold/xml-fold.js"
)

cm
```
