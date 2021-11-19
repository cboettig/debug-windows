#' test
#' @examples 
#' test()
#' @export
test <- function(){
  id <- "hash://sha256/e17632191c0487128aa6d1ecb932b655157ad7eab26f2749c9797ce65bbbc130"
  
  host <- "https://hash-archive.carlboettiger.info"
  # contentid:::hash_archive_api(id, "api/sources", host) # hangs
  contentid:::check_url(host)
  
  
}



test3 <- function(){  
    
  request <- paste0("https://hash-archive.carlboettiger.info/api/sources/",id)
  result <- tryCatch({
    response <- httr::GET(request)
    result <- httr::content(response, "parsed", "application/json")
  }, error = function(e) {
    message(e)
    list()
  }, finally = list())
  if (length(result) == 0) 
    return(contentid:::null_query())
  out <- lapply(result, contentid:::format_hashachiveorg)
  do.call(rbind, lapply(out, as.data.frame, stringsAsFactors = FALSE))
  
}

