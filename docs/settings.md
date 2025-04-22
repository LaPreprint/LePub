# Front matter

Used **front matter** fields. 

<!-- MyST front matter fields: https://mystmd.org/guide/frontmatter#available-frontmatter-fields -->


```yaml
title: str
subtitle: str
short_title: str
keywords: []
abstract: str
authors:
  - name: Mikkel Roald-Arbøl
    orcid: 0000-0002-7859-8394
    email: some@email.com
    url: https://roald-arboel.com
    roles: []
    degrees: []
    affiliations:
      - University of Sussex
open_access: boolean
license: []
doi: str
funding:
  - source: "NIH (Grant #: 1-R01-MH99999-01A1)"
    investigator: 
      - ref: nj
acknowledgments: 
bibliography: 
```

# Options

```yaml
options:
    theme-color: red
    font-body: "libertinus serif"
    font-body-size: 9pt
    line-spacing: 0.65em # or "single", "onehalf" or "double"
    line-numbers: true
    margin-side: left
    paper-size: "us-letter"
    heading-numbering: "1.1.1" # or another valid pattern, e.g. "1.a.i" or "none"
    logo: none
    logo-position: bottom # top or bottom
    funding: string
    data-availability: string
    endfloat: false // Not implemented yet!
```