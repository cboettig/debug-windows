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
  status <- contentid:::check_url(host)
#  if (status >= 400) 
#    out <- data.frame()
  request <- paste(host, endpoint, query, sep = "/")  
  response <- httr::GET(request)
#  result <- httr::content(response, "parsed", "application/json")

  
  

}

