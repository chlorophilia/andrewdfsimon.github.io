# Shared helpers for pulling CV/bibliography data out of Google Sheets.
# Sourced by R/generate_cv.R and R/generate_bibliography.R so both pages
# format citations identically and can't drift apart.

suppressMessages({
  library(gsheet)
  library(dplyr)
  library(purrr)
  library(glue)
  library(stringr)
})

sheet_ids <- list(
  Education      = "1nS5Lz1oQUSNLmF-RXKzcNAE_piFYgA0vp_iKF5LtRLE",
  Work           = "1V7-aia0Y570R5dJ9iTQdEQZ46J-4isaHOzo83mpl1HA",
  Leadership     = "1BUsrwXlt7WECMqla4BlSwk58_lVHXx1n50sylvCrM1Q",
  Awards         = "1cRU0-a9tYSgKipazUV_FHOPgqiqhK8ikZ_OFB1CE3vU",
  Certifications = "1rv1EJuD3hzt2SzbeSOUkmiJ3llaK3cMYGAx8LuEpsn8",
  Presentations  = "1p_3405v6NkrZEGqXOLmteXBeovMsTirQNEpiSQDqmvw",
  Publications   = "1gEblFCo3xv83kw7G_JFSi5Cy9sKZCCHPBdCrUJxLvI4"
)

fetch_sheet <- function(name) {
  url <- glue("https://docs.google.com/spreadsheets/d/{sheet_ids[[name]]}/edit?usp=sharing")
  gsheet2tbl(url, sheet = name)
}

fmt_bullets <- function(details) {
  if (is.na(details) || !nzchar(details)) return("")
  items <- str_split(details, "<br>")[[1]] |> str_trim()
  items <- items[nzchar(items)]
  if (length(items) == 0) return("")
  # Emitted as an HTML list (not markdown) so it sits inside the entry's raw
  # HTML grid without goldmark re-parsing.
  paste0("<ul>", paste(paste0("<li>", items, "</li>"), collapse = ""), "</ul>")
}

# Renders one CV entry as a two-column row (see .cv-entry in custom.css): the
# date and location stack in a left rail (.cv-meta); the bolded headline (`what`,
# falling back to `where`) and any bullets sit in the right column (.cv-body).
# Emitted as raw HTML so the whole entry stays one CSS grid.
fmt_entry <- function(what, when, where, with = NA_character_, why = NA_character_) {
  what_txt  <- if (!is.na(what) && nzchar(what)) what else NA
  where_txt <- if (!is.na(where) && nzchar(where)) where else NA

  title <- if (!is.na(what_txt)) {
    if (!is.na(where_txt)) glue("<strong>{what_txt}</strong> — {where_txt}") else glue("<strong>{what_txt}</strong>")
  } else if (!is.na(where_txt)) {
    glue("<strong>{where_txt}</strong>")
  } else {
    "<strong>—</strong>"
  }

  loc <- if (!is.na(with) && nzchar(with)) glue('<span class="cv-loc">{with}</span>') else ""

  glue('<div class="cv-entry"><div class="cv-meta"><span class="cv-date">{when}</span>{loc}</div>',
       '<div class="cv-body">{title}{fmt_bullets(why)}</div></div>')
}

strip_trailing_period <- function(x) str_remove(str_trim(x), "\\.+$")
clean_title <- function(x) strip_trailing_period(str_remove_all(x, "[{}]"))

# Formats one bibliography-style row (Presentations/Publications schema:
# bibtype,key,author,year,title,journal,volume,number,doi,url,note,category)
# as a single markdown citation, linked to its DOI/URL when available.
bold_self <- function(author) str_replace_all(author, "A\\.\\s?(D\\.\\s?F\\.\\s?)?Simon\\b", "**A.D.F. Simon**")

fmt_citation <- function(row) {
  journal <- strip_trailing_period(row$journal)
  author <- bold_self(row$author)
  cite <- glue("{author} ({row$year}) {clean_title(row$title)}. {journal}")
  if (!is.na(row$volume)) {
    vol <- as.character(row$volume)
    if (!is.na(row$number) && nzchar(row$number)) vol <- glue("{vol}({row$number})")
    cite <- glue("{cite}. {vol}")
  }
  cite <- glue("{cite}.")

  link <- NA_character_
  if (!is.na(row$doi) && nzchar(row$doi)) link <- glue("https://doi.org/{row$doi}")
  else if (!is.na(row$url) && nzchar(row$url)) link <- row$url

  if (!is.na(link)) glue("[{cite}]({link})") else cite
}

entries_md <- function(df, fmt) {
  df %>% purrr::pmap_chr(fmt) %>% paste(collapse = "\n\n")
}

citations_md <- function(sheet_name) {
  df <- fetch_sheet(sheet_name) %>% filter(category == "peer") %>% arrange(desc(year))
  purrr::map_chr(seq_len(nrow(df)), ~ fmt_citation(df[.x, ])) %>% paste(collapse = "\n\n")
}
