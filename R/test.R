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
  
  ver <- curl::curl_version()
  print(ver$version)
  handle <- curl::new_handle(nobody = TRUE, customrequest = "GET")
  
  if (utils::compareVersion(ver$version, "7.68.0") >= 0) {
    handle <- curl::handle_setopt(handle, http09_allowed = TRUE)
  }
  
  
  resp <- tryCatch(
    curl::curl_fetch_memory(file, handle), 
    error = function(e) {
      warning(as.character(e), call. = FALSE)
      list()
    },
    finally = list())

  
  
  request <- paste(host, endpoint, query, sep = "/")  
  response <- httr::GET(request)

  
  

}

