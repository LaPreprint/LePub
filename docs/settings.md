# General

We use a specific set of front matter and options across all formats. However, there may be slight differences in the naming, so be sure to check the reference for the format you use.

# Front matter

Used **front matter** fields. 

<!-- MyST front matter fields: https://mystmd.org/guide/frontmatter#available-frontmatter-fields -->


```yaml
---
title: 
subtitle: 
short-title: 
keywords: 
abstract:
  - title:
    content:
authors:
  - name: 
    orcid: 
    email: 
    url: 
    roles: 
    degrees: 
    affiliations:
      - id:
        index:
affiliations:
  - id:
    index:
    name:
    institution:
open-access: 
license:
  - id:
    url:
    name:
doi: 
funding:
  - source: 
    investigator: 
      - ref: 
acknowledgments: 
bibliography: 
---

# Introduction

Your paper starts here.
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
    section-numbering: "1.1.1" # or another valid pattern, e.g. "1.a.i" or "none"
    section-numbering-last: false # (2)!
    logo: none
    logo-position: bottom # top or bottom
    bibliography-style: string # (1)!
    funding: string
    data-availability: string
    endfloat: false // Not implemented yet!
```

1. Should be one of the [supported Typst styles](https://typst.app/docs/reference/model/bibliography/#styles) or the path to a CSL file.

2. When specifying a `section-numbering: "1.(a).(i)"`, you can set `section-numbering-last: true` to only show the last level of the heading (e.g. `(i)` for a third level header).