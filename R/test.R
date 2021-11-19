#' test
#' @examples 
#' test()
#' @export
test <- function(){
  id <- "hash://sha256/e17632191c0487128aa6d1ecb932b655157ad7eab26f2749c9797ce65bbbc130"
  host <- "https://hash-archive.carlboettiger.info"
  
  # contentid:::hash_archive_api(id, "api/sources", host) # hangs
  endpoint <- "api/sources"
  query <- id
  
  #contentid:::check_url(host)
  
  handle <- curl::new_handle(nobody = TRUE, customrequest = "GET")
  
  #handle <- curl::handle_setopt(handle, http09_allowed = TRUE)
  
  
  test <- curl::curl_fetch_memory(host, handle)
  

  
  
  request <- paste(host, endpoint, query, sep = "/")  
  response <- httr::GET(request)

  
  

}

