#import "../typreprint.typ": *
#let fm = pubmatter.load(yaml("frontmatter.yml"))
#show: typreprint.with(
  frontmatter: fm,
  theming: (
    font-body: "libertinus serif",
    line-numbers: true
  )
)

= Introduction
Some text