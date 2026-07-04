---
title: "Bumble bees, then and now: mapping change on Galiano Island"
date: 2026-07-04
draft: true
_build:
  render: never
  list: never
tags: ["community science", "bumble bees", "extirpation", "Galiano Island"]
summary: "A template research note — historical records, a community-mapped survey, and a look at what quietly shifts in a pollinator community over decades."
---

<link href="{{< blogdown/postref >}}index_files/htmltools-fill/fill.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/htmlwidgets/htmlwidgets.js"></script>

<script src="{{< blogdown/postref >}}index_files/jquery/jquery-3.6.0.min.js"></script>

<link href="{{< blogdown/postref >}}index_files/leaflet/leaflet.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/leaflet/leaflet.js"></script>

<link href="{{< blogdown/postref >}}index_files/leafletfix/leafletfix.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/proj4/proj4.min.js"></script>

<script src="{{< blogdown/postref >}}index_files/Proj4Leaflet/proj4leaflet.js"></script>

<link href="{{< blogdown/postref >}}index_files/rstudio_leaflet/rstudio_leaflet.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/leaflet-binding/leaflet.js"></script>

*This is a template post demonstrating the range of content a research note on this
site can hold — a static figure, an interactive map, a collapsible methods section, and
a set of related links. The figure below uses illustrative placeholder data, not the
published results; swap in the real numbers when adapting this post.*

Historical museum specimens and present-day community science observations rarely speak
to each other directly — different collectors, different effort, different decades. But
laid side by side, they can reveal quiet shifts in a pollinator community that neither
record shows alone.

<div class="pageinfo">

<strong>Key idea</strong> — absence of a record is not evidence of absence. A species
can be locally extirpated for years before that absence is even noticed, let alone
confirmed.

</div>

<div class="figure">

<img src="{{< blogdown/postref >}}index_files/figure-html/bee-detections-1.png" alt="Illustrative comparison of historical museum records and contemporary community-mapped observations by species (placeholder data)." width="672" />
<p class="caption">

<span id="fig:bee-detections"></span>Figure 1: Illustrative comparison of historical museum records and contemporary community-mapped observations by species (placeholder data).
</p>

</div>

Two patterns worth a second look: *B. californicus* drops from a modest historical
presence to zero contemporary detections despite substantial community search effort —
a candidate for local extirpation. *B. vosnesenskii*, rarely recorded historically, now
turns up regularly — a possible range shift or simply better detection through
iNaturalist-literate observers.

Community-mapped survey effort itself is worth showing, not just summarizing — search
effort is part of the evidence, not just a caveat.

<div class="leaflet html-widget html-fill-item" id="htmlwidget-1" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-1">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"https://openstreetmap.org/copyright/\">OpenStreetMap<\/a>,  <a href=\"https://opendatacommons.org/licenses/odbl/\">ODbL<\/a>"}]},{"method":"addCircleMarkers","args":[[48.9214,48.8944,48.9985,48.8767],[-123.3487,-123.3961,-123.3735,-123.4653],8,null,null,{"interactive":true,"className":"","stroke":false,"color":"#b6491f","weight":5,"opacity":0.5,"fill":true,"fillColor":"#b6491f","fillOpacity":0.85},null,null,null,null,["Bellhouse Park","Montague Harbour","Dionisio Point","Bodega Ridge"],{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"setView":[[48.92,-123.42],12,[]],"limits":{"lat":[48.8767,48.9985],"lng":[-123.4653,-123.3487]}},"evals":[],"jsHooks":[]}</script>

<details class="research-details">

<summary>

Survey methodology (placeholder — replace with real methods)
</summary>

<p>

Historical records compiled from museum specimen databases (e.g. GBIF-mediated
collections). Contemporary records drawn from community-mapped iNaturalist
observations, 2016–2025, restricted to research-grade identifications. Search effort
estimated from GPS track density, following the same approach used in the
<a href="https://github.com/IMERSS/detecting-local-extinction">extirpation detection protocol</a>.
</p>

</details>

This kind of comparison is really a small-scale version of the same question at the
heart of
[Simon, Best & Starzomski (2023)](https://doi.org/10.3955/046.096.0305) — what
does it take to responsibly claim a species has disappeared from a place, rather than
simply gone unnoticed? It is also, not coincidentally, the same question the diatom
monitoring work and the broader extirpation framework keep returning to at different
scales.

### Related

<div class="related-links">

<a href="http://biogaliano.org"><strong>Biodiversity Galiano</strong>Community-based biodiversity monitoring on Galiano Island</a>
<a href="https://imerss.org"><strong>IMERSS</strong>Institute for Multidisciplinary Ecological Research in the Salish Sea</a>
<a href="https://github.com/IMERSS/detecting-local-extinction"><strong>Detecting extirpation</strong>Protocol and documentation for the extirpation detection method</a>

</div>
