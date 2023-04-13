# generate before_body.html

local({
  before_body <- "include/before_body.html"

  cat('
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="./index.html">Andrew D.F. Simon</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="./Bibliography.html">Bibliography</a></li>
        <li><a target = "_blank" href="./cv2/cv2.html">CV</a></li>
        <li><a target = "_blank" href="https://imerss.github.io/imerss-bioinfo">GitHub</a></li>
        <li class="dropdown">
          <a href="authoring" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Projects<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">', file = before_body)

  index <- jsonlite::fromJSON("index.json")
  index <- subset(index, title!='Bibliography')
  index[index=="BioGaliano.html"] <- "http://www.biogaliano.org"
  index[index=="IMERSS.html"] <- "http://www.imerss.org"
  page_list  <- sort(sprintf('          <li><a target = "_blank" href="%s">%s</a></li>', index$url, index$title))
  cat(paste0(page_list, collapse = "\n"),
      file = before_body, append = TRUE)

  cat('
          </ul>
        </li>
      </ul>
    </div><!--/.nav-collapse -->
  </div><!--/.container -->
</div><!--/.navbar -->
', file = before_body, append = TRUE)
})
