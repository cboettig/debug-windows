#' test
#' 
#' This test will run fine on all other architectures, including local windows,
#' but fail on CRAN.
#' 
#' @examples 
#' test()
#' @export
test <- function(){
  host <- "https://hash-archive.carlboettiger.info"
  handle <- curl::new_handle(nobody = TRUE, customrequest = "GET")
  handle <- curl::handle_setopt(handle, http09_allowed = TRUE)
  test <- curl::curl_fetch_memory(host, handle)
  response <- httr::GET(host)
}

