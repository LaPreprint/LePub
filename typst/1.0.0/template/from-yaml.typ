#import "../lepub.typ": *
#let fm = pubmatter.load(yaml("frontmatter.yml"))
#show: lepub.with(
  frontmatter: fm,
  options: (
    font-body: "libertinus serif",
    line-numbers: true,
    theme-color: "#FF5733"
  )
)

= Introduction
Some text