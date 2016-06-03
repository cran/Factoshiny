CAshiny <-
function(X){
#  gassign("x", X)
  G <- .GlobalEnv
  assign("x", X, envir=G)
  nom=sys.calls()[[1]]
  nameJDD=nom[2]
#  gassign("nomData",nameJDD)
  assign("nomData", nameJDD, envir=G)
  if (!(inherits(X, "CAshiny") | inherits(X, "data.frame") | inherits(X, "CA"))){
    stop(gettext('df is not a dataframe, the results of the CAshiny function or a CA result'))
  }
  if(is.data.frame(X)==TRUE){
    if(dim(X)[1]<3 && dim(X)[2]<3)
      stop(gettext('not enough row/column'))
  }
  a=shiny::runApp(system.file("FactoCAapp2", package="Factoshiny"),launch.browser = TRUE)
  #a=shiny::runApp('C:/Users/Ordinateur/Dropbox/Factoshiny/Factoshiny/inst/FactoCAapp2')
  return(invisible(a))
}



