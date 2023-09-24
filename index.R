# generate file index, which is used for generating index.html and before_body.html(nav. bar)

local({
  parse_metadata <- function(f) {
    stopifnot(length(f) == 1 && file.exists(f))

    metadata <- rmarkdown:::yaml_front_matter(f)
    metadata$url <- sub(".Rmd", ".html", f)

    if(is.null(metadata$title)) metadata$title <- sub(".md", "", f)
    if(is.null(metadata$date))  metadata$date  <- file.mtime(f)

    metadata
  }

  rmd_pages  <- list.files(pattern = "*.Rmd")

  index <- jsonlite::toJSON(
    lapply(rmd_pages, parse_metadata),
    auto_unbox = TRUE, pretty = TRUE
  )

  index_file <- file("index.json", "w", encoding = "UTF-8")
  writeLines(index, con = index_file)
  close(index_file)
})
