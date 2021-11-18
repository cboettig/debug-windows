#' test
#' @examples 
#' test()
#' @export
test <- function(){
  id <- "hash://sha256/e17632191c0487128aa6d1ecb932b655157ad7eab26f2749c9797ce65bbbc130"
  #contentid::resolve(id)
  contentid:::sources_ha(id)
  contentid:::sources_dataone(id)
  contentid:::sources_zenodo(id)
  contentid:::sources_swh(id)
  contentid:::sources_store(id)
  
}
