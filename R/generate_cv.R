# Regenerates content/cv/index.md from the same Google Sheets that fed the
# old vitae-based CV (cv2.Rmd). Run automatically by R/build.R before every
# Hugo build. Run manually with: source("R/generate_cv.R")

source("R/cv_lib.R")

education <- fetch_sheet("Education")
education_md <- entries_md(education, function(Degree, Year, Institution, Location, ...)
  fmt_entry(what = Degree, when = Year, where = Institution, with = Location))

work <- fetch_sheet("Work")
work_md <- entries_md(work, function(Job, Year, Organization, Location, Details, ...)
  fmt_entry(what = Job, when = Year, where = Organization, with = Location, why = Details))

leadership <- fetch_sheet("Leadership")
leadership_md <- entries_md(leadership, function(Role, Year, Organization, Location, Details, ...)
  fmt_entry(what = Role, when = Year, where = Organization, with = Location, why = Details))

awards <- fetch_sheet("Awards")
awards_md <- entries_md(awards, function(Award, Year, Organization, Location, Details, ...)
  fmt_entry(what = Organization, when = Year, where = Award, with = Location, why = Details))

certifications <- fetch_sheet("Certifications")
certifications_md <- entries_md(certifications, function(Certification, Year, Organization, Details, ...)
  fmt_entry(what = Organization, when = Year, where = Certification, with = Details))

presentations_md <- citations_md("Presentations")
publications_md <- citations_md("Publications")

cv_md <- glue::glue('---
title: CV
---

<div class="cv-header">
<p class="cv-name site-signature">Andrew D.F. Simon</p>
<p class="cv-position">PhD Student | Biological Sciences | University of Alberta</p>
<p class="cv-contact">281 Highland Road, Galiano Island, BC, Canada, V0N 1P0 &middot; (250) 888-6144 &middot; <a href="mailto:adsimon@ualberta.ca">adsimon@ualberta.ca</a> &middot; <a href="https://imerss.org">imerss.org</a> &middot; <a href="https://bsky.app/profile/chlorophilia.bsky.social">{{{{< icon "bluesky" >}}}} Bluesky</a></p>
</div>

<button class="cv-print-btn" onclick="window.print()">Print / Save as PDF</button>

## Education

{education_md}

## Work History

{work_md}

## Leadership

{leadership_md}

## Awards, Grants, Recognitions

{awards_md}

## Certifications

{certifications_md}

## Presentations, Workshops

{presentations_md}

## Publications

{publications_md}
')

writeLines(cv_md, "content/cv/index.md")
message("Wrote content/cv/index.md from Google Sheets (", nrow(education), " education, ",
        nrow(work), " work, ", nrow(leadership), " leadership, ", nrow(awards), " awards, ",
        nrow(certifications), " certifications entries; presentations/publications from Sheets).")
