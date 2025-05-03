#show: lepub.with(
  frontmatter: (
    title: "$title$",
    abstract: [
      $abstract$
    ],
  $if(subtitle)$
    subtitle: "$subtitle$",
  $endif$
  $if(abstract-title)$
    short-title: "$abstract-title$",
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
  $if(section-numbering)$
    section-numbering: "$section-numbering$",
  $endif$
  $if(section-numbering-last)$
    section-numbering-last: $section-numbering-last$,
  $endif$
  $if(bibliography)$
    bibliography: (
      $for(bibliography)$
        ("$it$"),
      $endfor$
    ),
  $endif$
  $if(bibliographystyle)$
    bibliography-style: "$bibliographystyle$",
  $endif$
  parts: (
    $if(parts.funding)$
      funding: "$parts.funding$",
    $endif$
    $if(parts.data-availability)$
      data-availability: "$parts.data-availability$"
    $endif$
  ),
  $if(paper-size)$
    paper-size: "$paper-size$",
  $endif$
  $if(word-count)$
    word-count: $word-count$,
  $endif$
  )
)