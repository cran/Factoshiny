# global script for CA2
if(inherits(x, "data.frame") | inherits(x, "CA")){
  if(inherits(x, "data.frame")){
    newdataCAshiny <- x
    colonnesupCAshiny <- NULL
    quantisupCAshiny <- NULL
    lignesupCAshiny <- NULL
    catsupCAshiny <- NULL
  } else {
    nomDataCAshiny <- as.character(x$call$call[2])
    newdataCAshiny <- x$call$Xtot
    colonnesupCAshiny <- rownames(x$col.sup$coord)
    quantisupCAshiny <- rownames(x$quanti.sup$coord)
    lignesupCAshiny <- rownames(x$row.sup$coord)
    catsupCAshiny <- if (!is.null(x$quali.sup$coord)) {rownames(x$quali.sup$coord)} else{NULL}
  }
  axe1CAshiny <- 1
  axe2CAshiny <- 2
  InvisibleCAshiny <- NULL
  selec1CAshiny <- gettext("No selection",domain="R-Factoshiny")
  selec2CAshiny <- gettext("No selection",domain="R-Factoshiny")
  valueselec1CAshiny <- 0
  valueselec2CAshiny <- 0
  sizeCAshiny <- 1
  title1CAshiny <- gettext("CA factor map",domain="R-Factoshiny")
  title2CAshiny <- gettext("Supplementary quantitative variables",domain="R-Factoshiny")
  color_pointInit <- gettext("row/column",domain="R-Factoshiny")
  col1CAshiny <- "blue"
  col2CAshiny <- "red"
  col3CAshiny <- "#0C2B94"
  col4CAshiny <- "darkred"
  col5CAshiny  <- "magenta"
  ellipsesCAshiny <- NULL
  nbdimclustCAshiny <- 5
  hcpcparaCAshiny <- FALSE
 }

if(inherits(x, "CAshiny")){
nomDataCAshiny <- x$nomDataCAshiny
newdataCAshiny <- x$data
colonnesupCAshiny <- x$supvar
quantisupCAshiny <- x$quantisupvar
lignesupCAshiny <- x$rowsupl
catsupCAshiny <- x$supquali
axe1CAshiny <- x$nb1
axe2CAshiny <- x$nb2
color_pointInit <- x$color_point

InvisibleCAshiny <- x$invisi
selec1CAshiny <- x$seleccol
selec2CAshiny <- x$selecrow
valueselec1CAshiny <- x$selec1CAshiny
valueselec2CAshiny <- x$selec2CAshiny
sizeCAshiny <- x$taille
title1CAshiny <- x$title1CAshiny
title2CAshiny <- x$title2CAshiny
col1CAshiny <- x$col1CAshiny
col2CAshiny <- x$col2CAshiny
col3CAshiny <- x$col3CAshiny
col4CAshiny <- x$col4CAshiny
col5CAshiny  <- x$col5CAshiny
ellipsesCAshiny <- x$ellip
hcpcparaCAshiny <- x$hcpcparam
nbdimclustCAshiny <- x$nbdimclustCAshiny
}

VariableChoicesCAshiny <- names(which(sapply(newdataCAshiny,is.numeric)))
QualiChoiceCAshiny <- names(which(!(sapply(newdataCAshiny,is.numeric))))
if (length(QualiChoiceCAshiny)==0){
  listeChoixColourPoint<- list(gettext("row/column",domain="R-Factoshiny"),"cos2"="cos2","contribution"="contribution")
} else {
  listeChoixColourPoint <- list(gettext("row/column",domain="R-Factoshiny"),"cos2"="cos2","contribution"="contribution",gettext("qualitative variable",domain="R-Factoshiny"))
}
nomCAshiny <- rownames(newdataCAshiny)

nomDataCAshinycourt <- unlist(strsplit(as.character(nomDataCAshiny),"\\["))[1]
if(inherits(x, "data.frame")) catsupCAshiny <- QualiChoiceCAshiny
