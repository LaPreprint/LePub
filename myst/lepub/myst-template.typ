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
  [# if options.theme_color #]
    theme-color: "[-options.theme_color-]",
  [# endif #]
  [# if options.font_body #]
    font-body: "[-options.font_body-]",
  [# endif #]
  [# if options.font_body_size #]
    font-body-size: "[-options.font_body_size-]",
  [# endif #]
  [# if options.line_spacing #]
    line-spacing: [-options.line_spacing-],
  [# endif #]
  [# if options.line_numbers #]
    line-numbers: [-options.line_numbers-],
  [# endif #]
  [# if options.margin_side #]
    margin-side: "[-options.margin_side-]",
  [# endif #]
  [# if options.logo #]
    logo: [-options.logo-],
  [# endif #]
  [# if options.logo_position #]
    logo-position: "[-options.logo_position-]",
  [# endif #]
  )
)

[-CONTENT-]
