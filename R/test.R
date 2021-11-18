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
  contentid:::sources_tsv(id)
  
  registries <- c(
  "/home/cboettig/.local/share/R/contentid/registry.tsv",
#  "https://hash-archive.org",                            
#  "https://hash-archive.carlboettiger.info",             
#  "https://archive.softwareheritage.org",                
#  "https://cn.dataone.org",                              
#  "https://zenodo.org",                                  
#  "/home/cboettig/.local/share/R/contentid"
  )
  
  registries <- contentid:::expand_registry_urls(registries)
  types <- contentid:::detect_registry_type(registries)
  
  active_registries <- registries[types == "content_store"]
  out <- generic_source(id, 
                        registries = active_registries, 
                        type = "content_store")
  
  if (all(is.na(out$source)) | all) {
    remote <- types[types %in% c(MIXED, REMOTES)]
    remote_out <- lapply(
      remote,
      function(type) {
        active_registries <- registries[types == type]
        generic_source(id,
          registries = active_registries,
          type = type
        )
      }
    )
  
    remote_out <- do.call(rbind, remote_out)
    out <- rbind(out, remote_out)
  }
  # contentid:::filter_sources(out, registries, cols)
  
  
}
