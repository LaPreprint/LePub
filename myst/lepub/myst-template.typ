#import "lepub.typ": * 

[-IMPORTS-]

#show: lepub.with(
  frontmatter: (
    title: "[-doc.title-]",
    abstract: [
      [-parts.abstract-]
    ],
  [# if doc.subtitle #]
      subtitle: "[-doc.subtitle-]",
  [# endif #]
  [# if doc.short_title #]
    short-title: "[-doc.short_title-]",
  [# endif #]
  [# if doc.open_access !== undefined #]
    open-access: [-doc.open_access-],
  [# endif #]
  [# if doc.github !== undefined #]
    github: "[-doc.github-]",
  [# endif #]
  [# if doc.doi #]
    doi: "[-doc.doi-]",
  [# endif #]
  [# if doc.date #]
    date: datetime(
      year: [-doc.date.year-],
      month: [-doc.date.month-],
      day: [-doc.date.day-],
    ),
  [# endif #]
  [# if doc.keywords #]
    keywords: (
      [#- for keyword in doc.keywords -#]"[-keyword-]",[#- endfor -#]
    ),
  [# endif #]
    authors: (
  [# for author in doc.authors #]
      (
        name: "[-author.name-]",
      [# if author.orcid #]
        orcid: "[-author.orcid-]",
      [# endif #]
      [# if author.email #]
        email: "[-author.email-]",
      [# endif #]
      [# if author.affiliations #]
        affiliations: (
          [#- for aff in author.affiliations -#]
            "[-aff.index-]"
              [#- if not loop.last -#],
              [#- endif -#]
          [#- endfor -#]
          ),
      [# endif #]
        ),
      [# endfor #]
      ),
      affiliations: (
      [# for aff in doc.affiliations #] (
        id: "[-aff.index-]",
        name: "[-aff.name-]",
      ),
      [# endfor #]
    ),
  [# if doc.license.content #]
    license: (
      id: "[-doc.license.content.id-]", 
      name: "[-doc.license.content.name-]", 
      url: "[-doc.license.content.url-]"
    )
  [# endif #]
  ),
  options: (
    font-body: "libertinus serif",
    line-numbers: [-options.line-numbers-]
  )
)

[-CONTENT-]
