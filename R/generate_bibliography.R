# Regenerates content/bibliography/index.md. "Peer-reviewed Research" and
# "Presentations, Workshops" are pulled live from the same Publications/
# Presentations Sheets used by the CV (see R/generate_cv.R), so the two pages
# can't drift apart. The remaining sections have no Sheet to source from and
# are hand-maintained here.

source("R/cv_lib.R")

publications_md  <- citations_md("Publications")
presentations_md <- citations_md("Presentations")

static_sections <- '
## In Review

A.D.F. Simon, A. Chang, J. Whitehead, E. Humphrey, E. Morien, A. van Asselt, M. Webber (In Review) Linnaean and Darwinian shortfalls limit long-term monitoring of Salish Sea diatoms.

## In the Media

S. Doll (2023, August 5) [Maxwell Creek Watershed Project Field Files Part 2: Developing surveying methodologies](https://www.raincoast.org/2022/08/maxwell-creek-watershed-project-field-files-part-2-developing-surveying-methodologies/). Raincoast Conservation Foundation.

M. Wang (2022, June 28) [A Community\'s Quest to Document Every Species on Their Island Home](https://hakaimagazine.com/features/a-communitys-quest-to-document-every-species-on-their-island-home) Hakai Magazine.

L. Weidenhammer (2022, June 15) [Stalking the Wild Flora and Fauna of Galiano Island](https://www.bcnativebees.org/post/stalking-the-wild-flora-and-fauna-of-galiano-island). Native Bee Society of BC.

D. Wood (2020, Summer) Stumbling toward oblivion: without provincial legislation, British Columbia\'s endangered species face extinction. British Columbia Magazine, 62(2), 32-33.

M. Wang (2017, September 21) [Citizen science platform iNaturalist is testing artificial intelligence to help with species identification](https://canadiangeographic.ca/articles/citizen-science-platform-inaturalist-is-testing-artificial-intelligence-to-help-with-species-identification/). Canadian Geographic.

## Other Works

A. Antonelli et al. (2026). State of the World\'s Plants and Fungi 2026. Royal Botanic Gardens, Kew. https://doi.org/10.34885/rdzs-ky83

L. Magner, A.D.F. Simon (2019) Key to the Conifers of Galiano Island, BC, 2150. In C. Sandilands (Ed.), Rising Tides (pp. 199–204). Halfmoon Bay, BC: Caitlin Press.

## Theses

[A.D.F. Simon (2020) Water into nectar: the effects of seasonal drought on bumble bee and flowering plant communities (MSc thesis).](https://dspace.library.uvic.ca:8443/handle/1828/11837/)

A.D.F. Simon (2016) Potential risks and mitigations of prescribed fire in caribou habitat (Honour\'s Thesis).
'

bibliography_md <- glue::glue('---
title: Bibliography
---

## Peer-reviewed Research

{publications_md}

## Presentations, Workshops

{presentations_md}
{static_sections}')

writeLines(bibliography_md, "content/bibliography/index.md")
message("Wrote content/bibliography/index.md (Peer-reviewed Research + Presentations, Workshops from Sheets; remaining sections static).")
