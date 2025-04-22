#show: lepub.with(
  frontmatter: (
    title: "$title$",
    abstract: [
      $abstract$
    ],
  $if(subtitle)$
    subtitle: "$subtitle$",
  $endif$
  $if(short_title)$
    short-title: "$short_title$",
  $endif$
  $if(open_access)$
    open-access: $open_access$,
  $endif$
  $if(github)$
    github: "$github$",
  $endif$
  $if(doi)$
    doi: "$doi$",
  $endif$
  $if(date)$
    date: datetime(
      year: $date.year$,
      month: $date.month$,
      day: $date.day$,
    ),
  $endif$
  $if(keywords)$
    keywords: (
      $for(keywords)$
      "$it$",
      $endfor$
    ),
  $endif$
    authors: (
    $for(authors)$
      (
        name: "$it.name.literal$",
      $if(it.orcid)$
        orcid: "$it.orcid$",
      $endif$
      $if(it.email)$
        email: "$it.email$",
      $endif$
      $if(it.affiliations)$
        affiliations: (
          $for(it.affiliations)$
          "$it.index$",
          $endfor$
        ),
      $endif$
      ),
    $endfor$
    ),
    affiliations: (
    $for(affiliations)$ 
      (
        id: "$it.index$",
        name: "$it.name$",
      ),
    $endfor$
    ),
  $if(license)$
    license: (
      id: "$license.id$", 
      name: "$license.name$", 
      url: "$license.url$"
    )
  $endif$
  ),
  options: (
  $if(hi)$
    hi: "$hi$",
  $endif$
  $if(theme-color)$
    theme-color: "$theme-color$",
  $endif$
  $if(font-body)$
    font-body: "$font-body$",
  $endif$
  $if(font-body-size)$
    font-body-size: "$font-body-size$",
  $endif$
  $if(line-spacing)$
    line-spacing: "$line-spacing$",
  $endif$
  $if(line-numbers)$
    line-numbers: $line-numbers$,
  $endif$
  $if(margin-side)$
    margin-side: "$margin-side$",
  $endif$
  $if(logo)$
    logo: "$logo$",
  $endif$
  $if(logo-position)$
    logo-position: "$logo-position$",
  $endif$
  $if(part-funding)$
    funding: "$part-funding$",
  $endif$
  $if(part-data-availability)$
    data-availability: "$part-data-availability$",
  $endif$
  )
)