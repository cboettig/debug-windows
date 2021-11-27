#' test
#' 
#' This test will run fine on all other architectures, including local windows,
#' but run forever without timing out when run on GH-Actions Windows builder.
#' 
#' @examples 
#' test()
#' @export
test <- function(){
  host <- "https://hash-archive.carlboettiger.info"
  handle <- curl::new_handle(
    #nobody = TRUE, 
    customrequest = "GET")
#  handle <- curl::handle_setopt(handle, http09_allowed = TRUE)
  test <- curl::curl_fetch_memory(host, handle)
  response <- httr::GET(host)
}

